import 'dart:developer' show log;

import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/models/patient_model.dart';
import '../../../../../core/services/dio/auth_dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());
  bool isAuthenticated = false;
  Future<void> login({required final Map credintials}) async {
    emit(const AuthLoading());
    try {
      var response = await dio().post('/login', data: credintials);
      log(response.data);
      checkCodeStatus(response: response);
    } on dio_package.DioException catch (e) {
      isAuthenticated = false;
      log('E ----->  $e');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({required final PatientModel patient}) async {
    emit(const AuthLoading());
    try {
      var response = await dio().post(
        '/register',
        data: patient.toJson(),
        options: dio_package.Options(
          contentType: dio_package.Headers.jsonContentType,
        ),
      );
      log(response.data);
      checkCodeStatus(response: response);
    } on dio_package.DioException catch (e) {
      isAuthenticated = false;
      log('E ----->  $e');
      emit(AuthFailure(e.toString()));
    }
  }

  void checkCodeStatus({required final dio_package.Response response}) {
    if (response.statusCode == 200) {
      isAuthenticated = true;
      emit(const AuthSuccess());
      log('---------------- SignUp Success -------------');
    } else if (response.statusCode == 401) {
      isAuthenticated = false;
      emit(const AuthFailure('Unauthorized: Invalid credentials'));
      log('E -----> Unauthorized: Invalid credentials');
    } else if (response.statusCode == 403) {
      isAuthenticated = false;
      emit(const AuthFailure('Forbidden: Access denied'));
      log('E -----> Forbidden: Access denied');
    } else if (response.statusCode == 404) {
      isAuthenticated = false;
      emit(const AuthFailure('Not Found: Endpoint does not exist'));
      log('E -----> Not Found: Endpoint does not exist');
    } else if (response.statusCode == 500) {
      isAuthenticated = false;
      emit(const AuthFailure('Server Error: Please try again later'));
      log('E -----> Server Error: Please try again later');
    } else {
      isAuthenticated = false;
      emit(AuthFailure('Login failed: ${response.statusCode}'));
      log('E -----> Login failed: ${response.statusCode}');
    }
  }
}
