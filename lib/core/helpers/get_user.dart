import '../entities/user_entity.dart';
import '../repos/user_repo.dart';
import '../services/get_it_service.dart';

UserEntity? get getUser => getIt<UserRepo>().getUserFromLocal();

