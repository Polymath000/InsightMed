import 'dart:developer' show log;

import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/dio_error_message.dart';
import '../../../../../core/helpers/get_auth_message.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/repos/auth_repo.dart';
import '../../../../../core/services/dio/auth_dio.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../appointments/cubit/book_appointment/book_appointment_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());
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
      if (!isClosed) {
        emit(AuthSuccess());
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(
        const AuthFailure(
          'There was an error , contact us to solve the problem or try later',
        ),
      );
    }
  }

  Future<void> register({required final UserEntity user}) async {
    emit(const AuthLoading());
    try {
      await getIt<AuthRepository>().register(user: user);
      emit(AuthSuccess());
    } on dio_package.DioException catch (e) {
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
      final userMessage = mapDioErrorToMessage(e);
      emit(AuthFailure(userMessage));
    } on Exception catch (e) {
      log(e.toString());
      emit(AuthFailure(_messages['msgUnknown']!));
    }
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    try {
      await SharedPreferencesSingleton.setBool(isBookedKey, value: false);
      emit(AuthSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(const AuthFailure('There was an error in logout'));
    }
  }
}
