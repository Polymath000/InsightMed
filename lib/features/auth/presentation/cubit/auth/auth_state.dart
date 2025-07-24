part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  const AuthFailure(this.message);
  final String message;
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}
