import 'dart:developer' show log;

import 'package:dio/dio.dart' as dio_package;
import 'package:flutter/material.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/helpers/dio_error_message.dart';
import '../../../../../core/helpers/get_auth_message.dart';
import '../../../../../core/models/doctor_model.dart';
import '../../../../../core/models/patient_model.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/services/dio/auth_dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());
  bool isAuthenticated = false;
  PatientModel? patientModel;
  DoctorModel? doctorModel;
  UserModel? user;
  String _token = '';
  final Map<String, String> _messages = getAuthMessages;
  void chooseDoctorOrPatient({required final dataRespnse}) {
    if (!isDoctor()) {
      patientModel = PatientModel.fromJson(dataRespnse);
    } else {
      doctorModel = DoctorModel.fromJson(dataRespnse);
    }
  }

  bool isDoctor() => user!.role == 'patient';

  void tryToken({required String token}) async {
    try {
      var response;
      final dioInstance = dio();
      log('I am in tryToken');
      response = await dioInstance.get(
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
      log(user!.email ?? 'No Email Found');
      chooseDoctorOrPatient(dataRespnse: userData);
      log('isDoctor-----> ${isDoctor()}');

      log(
        'Response data: ${isDoctor() ? doctorModel!.email : patientModel!.email}',
      );
      _token = token;
      emit(AuthSuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({required final PatientModel patient}) async {
    emit(const AuthLoading());
    try {
      final dioInstance = dio();
      var response = await dioInstance.post(
        '/register',
        data: patient.toJson(),
        options: dio_package.Options(
          contentType: dio_package.Headers.jsonContentType,
        ),
      );

      String token = response.data.toString();
      tryToken(token: token);

      if (response != null) {
        checkCodeStatus(response: response);
      } else {
        isAuthenticated = false;
        emit(AuthFailure(_messages['msgUnknown']!));
        log('Null response received');
      }
    } on dio_package.DioException catch (e) {
      isAuthenticated = false;
      final userMessage = mapDioErrorToMessage(e);
      emit(AuthFailure(userMessage));
      log('DioException: \n');
      log(e.toString());
    } on Exception catch (e) {
      isAuthenticated = false;
      emit(AuthFailure(_messages['msgUnknown']!));
      log('Exception: \n');
      log(e.toString());
    }
  }

  Future<void> login({required final Map<String, dynamic> creds}) async {
    emit(const AuthLoading());
    try {
      log('I am in login');
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
      if (response.statusCode == 200) {
        String token = response.data['token'];
        tryToken(token: token);
        log('token ----> $token');
      } else {
        isAuthenticated = false;
        String errorMessage = response.data['message'] ?? 'Login Failed';
        emit(AuthFailure(errorMessage));
        log('Login failed with status ${response.statusCode}: $errorMessage');
      }
    } on dio_package.DioException catch (e) {
      isAuthenticated = false;
      final userMessage = mapDioErrorToMessage(e);
      emit(AuthFailure(userMessage));
      log('DioException: \n');
      log(e.toString());
    } on Exception catch (e) {
      isAuthenticated = false;
      emit(AuthFailure(_messages['msgUnknown']!));
      log('Exception: \n');
      log(e.toString());
    }
  }

  void logout() async {
    try {
      final dioInstance = dio();
      var response = await dioInstance.get(
        '/logout',
        options: dio_package.Options(
          headers: {'Authorization': 'Bearer $_token'},
        ),
      );

      cleanUp();
    } catch (e) {}
  }

  void cleanUp() {
    patientModel = null;
    isAuthenticated = false;
    _token = '';
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
