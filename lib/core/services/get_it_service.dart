import 'package:get_it/get_it.dart';

import '../repos/auth_repo.dart';
import 'api_client.dart';
import 'auth_service.dart';
import 'database_service.dart';
import 'database_service_implementation.dart';

final GetIt getIt = GetIt.instance;
GetIt setupGetIt() => getIt
  ..registerLazySingleton<AuthService>(() => AuthServiceImpl(ApiClient()))
  ..registerLazySingleton<DatabaseService>(
    () => const DatabaseServiceImplementation(),
  )
  ..registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthService>()),
  );
