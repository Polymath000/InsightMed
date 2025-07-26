import 'dart:developer' show log;

import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/dio_error_message.dart';
import '../../../../../core/helpers/get_auth_message.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/repos/auth_repo.dart';
import '../../../../../core/services/dio/auth_dio.dart';
import '../../../../../core/services/get_it_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());
  bool isAuthenticated = false;
  UserModel? user;
  final Map<String, String> _messages = getAuthMessages;

  Future<void> tryToken({required final String token}) async {
    try {
      final dioInstance = dio();
      log('I am in tryToken');
      var response = await dioInstance.get(
        '/dashboard',
        options: dio_package.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      log('Token : $token');
      log('Dashboard Response Data: ${response.data}');

      final userData = response.data['role'] == 'patient'
          ? response.data['patient_data']
          : response.data['doctor_data'];
      user = UserModel.fromJson(userData);
      mainToken = token;
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
      // final dioInstance = dio();
      // var response = await dioInstance.post(
      //   '/register',
      //   data: UserModel.fromEntity(user).toJson(),
      //   options: dio_package.Options(
      //     contentType: dio_package.Headers.jsonContentType,
      //   ),
      // );
      // var token = response.data.toString();
      // await tryToken(token: token);
      // checkCodeStatus(response: response);
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

  Future<void> login({required final Map<String, dynamic> creds}) async {
    emit(const AuthLoading());
    try {
      final dioInstance = dio();
      var response = await dioInstance.post(
        '/login',
        data: creds,
        options: dio_package.Options(
          validateStatus: (_) => true,
          contentType: dio_package.Headers.jsonContentType,
          responseType: dio_package.ResponseType.json,
        ),
      );
      String token = response.data['token'];
      await tryToken(token: token);
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

  void logout() async {
    try {
      final dioInstance = dio();
      var response = await dioInstance.get(
        '/logout',
        options: dio_package.Options(
          headers: {'Authorization': 'Bearer $mainToken'},
        ),
      );

      cleanUp();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void cleanUp() {
    user = null;
    isAuthenticated = false;
    mainToken = '';
    // TODO
    // await storage.delete(key: 'token');
  }

  void checkCodeStatus({required final dio_package.Response response}) {
    switch (response.statusCode) {
      case 200:
        isAuthenticated = true;
        emit(AuthSuccess());
        log(_messages['msgOk']!);
        break;
      case 201:
        isAuthenticated = true;
        emit(AuthSuccess());
        log(_messages['msgCreated']!);
        break;
      case 400:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgBadRequest']!));
        log(_messages['msgBadRequest']!);
        break;
      case 401:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnauthorized']!));
        log(_messages['msgUnauthorized']!);
        break;
      case 403:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgForbidden']!));
        log(_messages['msgForbidden']!);
        break;
      case 404:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgNotFound']!));
        log(_messages['msgNotFound']!);
        break;
      case 409:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgConflict']!));
        log(_messages['msgConflict']!);
        break;
      case 422:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnprocessable']!));
        log(_messages['msgUnprocessable']!);
        break;
      case 500:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgInternal']!));
        log(_messages['msgInternal']!);
        break;
      case 503:
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnavailable']!));
        log(_messages['msgUnavailable']!);
        break;
      default:
        isAuthenticated = false;
        emit(AuthFailure('Error: ${response.statusCode}'));
        log('Error: ${response.statusCode}');
    }
  }
}
