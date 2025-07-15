import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:meta/meta.dart';

import '../../../../../core/services/dio/auth_dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isAuthenticated = false;
  
  // ...existing code...
  Future<void> login({required final Map credintials}) async {
    emit(AuthLoading());
    try {
      var response = await dio().post(
        '/sanctum/token',
        data: credintials,
      );
      checkCodeStatus(response: response);
    } catch (e) {
      isAuthenticated = false;
      emit(AuthFailure(e.toString()));
    }
  }

  void checkCodeStatus({required final dio_package.Response response}) {
    if (response.statusCode == 200) {
      isAuthenticated = true;
      emit(AuthSuccess());
    } else if (response.statusCode == 401) {
      isAuthenticated = false;
      emit(AuthFailure('Unauthorized: Invalid credentials'));
    } else if (response.statusCode == 403) {
      isAuthenticated = false;
      emit(AuthFailure('Forbidden: Access denied'));
    } else if (response.statusCode == 404) {
      isAuthenticated = false;
      emit(AuthFailure('Not Found: Endpoint does not exist'));
    } else if (response.statusCode == 500) {
      isAuthenticated = false;
      emit(AuthFailure('Server Error: Please try again later'));
    } else {
      isAuthenticated = false;
      emit(AuthFailure('Login failed: ${response.statusCode}'));
    }
  }
}
