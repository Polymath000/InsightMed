import '../entities/user_entity.dart';
import '../models/user_model.dart';
import 'api_client.dart';

abstract class AuthService {
  Future<UserEntity> register(final UserEntity user);

  Future<String> login(final String email, final String password);

  Future<void> logout();
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this.client);
  final ApiClient client;

  @override
  Future<UserEntity> register(final UserEntity user) async {
    await client.post(
      path: '/api/register',
      data: UserModel.fromEntity(user).toJson(),
    );
    return user;
  }

  @override
  Future<String> login(final String email, final String password) async {
    final data = await client.post(
      path: '/api/login',
      data: {'email': email, 'password': password},
    );
    final token = data['token'] as String;
    // store token
    await ApiClient.storage.write(key: 'access_token', value: token);
    return token;
  }

  @override
  Future<void> logout() async {
    await client.post(path: '/api/logout');
    await ApiClient.storage.delete(key: 'access_token');
  }
}
