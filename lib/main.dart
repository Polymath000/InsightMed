import 'package:flutter/material.dart';
import 'core/services/app_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'core/services/shared_preferences_singleton.dart'
    show SharedPreferencesSingleton;
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  await SharedPreferencesSingleton.init();
  const AppBlocObserver().init();

  return runApp(const InsightMed());
}
