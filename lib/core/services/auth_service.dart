import '../../features/appointments/cubit/book_appointment/book_appointment_cubit.dart';
import '../constants/end_ponits.dart';
import '../entities/user_entity.dart';
import '../models/user_model.dart';
import '../repos/user_repo.dart';
import 'api_client.dart';
import 'get_it_service.dart';
import 'shared_preferences_singleton.dart';

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
      path: EndPoint.addRegister,
      data: UserModel.fromEntity(user).toJson(),
    );
    return user;
  }

  @override
  Future<String> login(final String email, final String password) async {
    final data = await client.post(
      path: EndPoint.addLogin,
      data: {'email': email, 'password': password},
    );
    final token = data['token'] as String;
    await SharedPreferencesSingleton.setString('access_token', token);
    return token;
  }

  @override
  Future<void> logout() async {
    await client.post(path: EndPoint.addLogout);
    await SharedPreferencesSingleton.remove('access_token');
    await getIt<UserRepo>().deleteFromLocal();
    await SharedPreferencesSingleton.setBool(isBookedKey, false, value: false);
  }
}
