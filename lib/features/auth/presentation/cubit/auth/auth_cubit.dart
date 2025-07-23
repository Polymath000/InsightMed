import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:meta/meta.dart';

import '../../../../../core/models/patient_model.dart';
import '../../../../../core/services/dio/auth_dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isAuthenticated = false;
  Future<void> login({required final Map credintials}) async {
    emit(AuthLoading());
    try {
      var response = await dio().post('/login', data: credintials);
      print(response.data);
      checkCodeStatus(response: response);
    } catch (e) {
      isAuthenticated = false;
      print('E ----->  ${e.toString()}');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({required final PatientModel patient}) async {
    emit(AuthLoading());
    try {
      var response = await dio().post(
        '/register',
        data: patient.toJson(),
        options: dio_package.Options(
          contentType: dio_package.Headers.jsonContentType,
        ),
      );
      print(response.data);
      checkCodeStatus(response: response);
    } catch (e) {
      isAuthenticated = false;
      print('E ----->  ${e.toString()}');
      emit(AuthFailure(e.toString()));
    }
  }

  void checkCodeStatus({required final dio_package.Response response}) {
    if (response.statusCode == 200) {
      isAuthenticated = true;
      emit(AuthSuccess());
      print('---------------- SignUp Success -------------');
    } else if (response.statusCode == 401) {
      isAuthenticated = false;
      emit(AuthFailure('Unauthorized: Invalid credentials'));
      print('E -----> Unauthorized: Invalid credentials');
    } else if (response.statusCode == 403) {
      isAuthenticated = false;
      emit(AuthFailure('Forbidden: Access denied'));
      print('E -----> Forbidden: Access denied');
    } else if (response.statusCode == 404) {
      isAuthenticated = false;
      emit(AuthFailure('Not Found: Endpoint does not exist'));
      print('E -----> Not Found: Endpoint does not exist');
    } else if (response.statusCode == 500) {
      isAuthenticated = false;
      emit(AuthFailure('Server Error: Please try again later'));
      print('E -----> Server Error: Please try again later');
    } else {
      isAuthenticated = false;
      emit(AuthFailure('Login failed: ${response.statusCode}'));
      print('E -----> Login failed: ${response.statusCode}');
    }
  }
}
