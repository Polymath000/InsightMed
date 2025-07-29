import 'package:get_it/get_it.dart';

import '../../features/notes/data/repos/note_repo_impl.dart';
import '../../features/notes/domain/repos/note_repo.dart';
import '../repos/auth_repo.dart';
import '../repos/dashboard_repo.dart';
import '../repos/ray_repo.dart';
import '../repos/user_repo.dart';
import 'api_client.dart';
import 'auth_service.dart';
import 'database_service.dart';
import 'dio_service.dart';

final GetIt getIt = GetIt.instance;
GetIt setupGetIt() => getIt
  ..registerLazySingleton<ApiClient>(DioClient.new)
  ..registerLazySingleton<AuthService>(
    () => AuthServiceImpl(getIt<ApiClient>()),
  )
  ..registerLazySingleton<DatabaseService>(
    () => DatabaseServiceImpl(getIt<ApiClient>()),
  )
  ..registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthService>(), getIt<UserRepo>()),
  )
  ..registerLazySingleton<UserRepo>(
    () => UserRepoImpl(getIt<DatabaseService>()),
  )
  ..registerLazySingleton<DashboardRepo>(
    () => DashboardRepoImpl(getIt<DatabaseService>()),
  )
  ..registerLazySingleton<NoteRepo>(
    () => NoteRepoImpl(getIt<DatabaseService>()),
  )
  ..registerLazySingleton<RayRepo>(() => RayRepoImpl(getIt<DatabaseService>()));
