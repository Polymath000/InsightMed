import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/dio/auth_dio.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  Future<void> sendVerifiedCode({required final String email}) async {
    emit(ResetPasswordLoading());

    try {
      final dioInstance = dio();
      await dioInstance.post(
        '/forgot-password',
        data: {'email': email},
        options: Options(headers: _setHeaders()),
      );
      if (!isClosed) {
        emit(ResetPasswordSuccess());
      }
    } on DioException {
      const message = 'This email maybe not correct';
      emit(ResetPasswordFailure(message: 'Error : $message'));
    } on Exception {
      emit(
        ResetPasswordFailure(
          message: 'There was an error, please try again later',
        ),
      );
    }
  }

  Future<void> checkVerifiedCode({
    required final String code,
    required final String email,
  }) async {
    emit(VerifyCodeLoading());
    try {
      final dioInstance = dio();
      await dioInstance.post(
        '/verify-reset-code',
        data: {'email': email, 'code': code},
        options: Options(headers: _setHeaders()),
      );

      if (!isClosed) {
        emit(VerifyCodeSuccess());
      }
    } on DioException catch (e) {
      var message = e.response?.data['message'];
      message == null || message == ''
          ? message = 'There was an error, please try again later'
          : message = message;
      emit(ResetPasswordFailure(message: 'Error : $message'));
    } on Exception {
      emit(
        ResetPasswordFailure(
          message: 'There was an error, please try again later',
        ),
      );
    }
  }

  Future<void> createNewPassword({
    required final String code,
    required final String email,
    required final String password,
    required final String passwordConfirmation,
  }) async {
    emit(CreateNewPasswordLoading());
    try {
      final dioInstance = dio();
      await dioInstance.post(
        '/reset-password',
        data: {
          'email': email,
          'code': code,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        options: Options(headers: _setHeaders()),
      );
      if (!isClosed) {
        emit(CreateNewPasswordSuccess());
      }
    } on Exception {
      emit(
        ResetPasswordFailure(
          message: 'There was an error please try again later',
        ),
      );
    }
  }
}

Map<String, String> _setHeaders() => {'Accept': 'application/json'};
