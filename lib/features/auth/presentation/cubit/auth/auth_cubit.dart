import 'dart:developer' show log;

import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/dio_error_message.dart';
import '../../../../../core/helpers/get_auth_message.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/repos/auth_repo.dart';
import '../../../../../core/services/dio/auth_dio.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../appointments/cubit/book_appointment/book_appointment_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());
  bool isAuthenticated = false;
  UserModel? user;
  final Map<String, String> _messages = getAuthMessages;

  Future<void> tryToken({required final String token}) async {
    try {
      final dioInstance = dio();
      var response = await dioInstance.get<Map<String, dynamic>>(
        '/dashboard',
        options: dio_package.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final userData = response.data?['role'] == 'patient'
          ? (response.data?['patient_data'])
          : response.data?['doctor_data'];
      user = UserModel.fromJson(userData);
      emit(AuthSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({required final UserEntity user}) async {
    emit(const AuthLoading());
    try {
      await getIt<AuthRepository>().register(user: user);
      emit(AuthSuccess());
    } on dio_package.DioException catch (e) {
      isAuthenticated = false;
      log('Registration failed with status code: ${e.response?.statusCode}');
      log('Error response: ${e.response?.data}');

      var errorMessage = 'An unknown error occurred.';
      if (e.response?.data is Map<String, dynamic>) {
        final responseData = e.response!.data as Map<String, dynamic>;
        if (responseData.containsKey('errors')) {
          final errors = responseData['errors'] as Map<String, dynamic>;
          errorMessage = errors.entries
              .map(
                (final entry) =>
                    '${entry.key}: ${(entry.value as List).join(', ')}',
              )
              .join('\n');
        } else if (responseData.containsKey('message')) {
          errorMessage = responseData['message'] as String;
        }
      } else {
        errorMessage = mapDioErrorToMessage(e);
      }

      emit(AuthFailure(errorMessage));
    } on Exception catch (e) {
      log(e.toString());
      isAuthenticated = false;
      emit(AuthFailure(_messages['msgUnknown']!));
    }
  }

  Future<void> login({
    required final String email,
    required final String password,
  }) async {
    emit(const AuthLoading());
    try {
      final token = await getIt<AuthRepository>().login(
        email: email,
        password: password,
      );
      await tryToken(token: token);
      log(getUser!.id.toString());
    } on dio_package.DioException catch (e) {
      isAuthenticated = false;
      final userMessage = mapDioErrorToMessage(e);
      emit(AuthFailure(userMessage));
    } on Exception catch (e) {
      log(e.toString());

      isAuthenticated = false;
      emit(AuthFailure(_messages['msgUnknown']!));
    }
  }

  Future<void> logout() async {
    try {
      await SharedPreferencesSingleton.setBool(
        isBookedKey,
        false,
        value: false,
      );
      cleanUp();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void cleanUp() {
    user = null;
    isAuthenticated = false;
  }

  void checkCodeStatus({required final dio_package.Response response}) {
    switch (response.statusCode) {
      case 200:
        isAuthenticated = true;
        emit(AuthSuccess());
        log(_messages['msgOk']!);
      case 201:
        isAuthenticated = true;
        emit(AuthSuccess());
        log(_messages['msgCreated']!);
      case 400:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgBadRequest']!));
        log(_messages['msgBadRequest']!);
      case 401:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnauthorized']!));
        log(_messages['msgUnauthorized']!);
      case 403:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgForbidden']!));
        log(_messages['msgForbidden']!);
      case 404:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgNotFound']!));
        log(_messages['msgNotFound']!);
      case 409:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgConflict']!));
        log(_messages['msgConflict']!);
      case 422:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnprocessable']!));
        log(_messages['msgUnprocessable']!);
      case 500:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgInternal']!));
        log(_messages['msgInternal']!);
      case 503:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnavailable']!));
        log(_messages['msgUnavailable']!);
      default:
        isAuthenticated = false;
        emit(AuthFailure('Error: ${response.statusCode}'));
        log('Error: ${response.statusCode}');
    }
  }
}
