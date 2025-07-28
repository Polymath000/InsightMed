part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

// States for sending the reset email
final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {}

final class ResetPasswordFailure extends ResetPasswordState {
  ResetPasswordFailure({required this.message});
  String message;
}

// States for verifying the code
final class VerifyCodeLoading extends ResetPasswordState {}

final class VerifyCodeSuccess extends ResetPasswordState {}

// States for creating the new password
final class CreateNewPasswordLoading extends ResetPasswordState {}

final class CreateNewPasswordSuccess extends ResetPasswordState {}
