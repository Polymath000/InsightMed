import 'package:get_it/get_it.dart';

import 'database_service.dart';
import 'database_service_implementation.dart';

final GetIt getIt = GetIt.instance;
GetIt setupGetIt() => getIt
  ..registerLazySingleton<DatabaseService>(
    () => const DatabaseServiceImplementation(),
  );
