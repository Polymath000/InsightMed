import '../entities/user_entity.dart';
import '../services/auth_service.dart';
import 'user_repo.dart';

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
  const AuthRepositoryImpl(this._authService, this._userRepo);
  final AuthService _authService;
  final UserRepo _userRepo;

  @override
  Future<void> register({required final UserEntity user}) =>
      _authService.register(user).then(_userRepo.addToLocal);

  @override
  Future<String> login({
    required final String email,
    required final String password,
  }) => _authService.login(email, password);

  @override
  Future<void> logout() => _authService.logout();
}
