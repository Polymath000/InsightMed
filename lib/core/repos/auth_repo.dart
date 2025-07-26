import '../entities/user_entity.dart';
import '../services/auth_service.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<void> register({required final UserEntity user});

  Future<String> login({
    required final String email,
    required final String password,
  });

  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.auth);
  final AuthService auth;

  @override
  Future<void> register({required final UserEntity user}) =>
      auth.register(user);

  @override
  Future<String> login({
    required final String email,
    required final String password,
  }) => auth.login(email, password);

  @override
  Future<void> logout() => auth.logout();
}
