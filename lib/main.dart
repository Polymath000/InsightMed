import 'package:flutter/material.dart';
import 'core/services/app_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'main_app.dart';

void main() {
  setupGetIt();
  const AppBlocObserver().init();

  return runApp(const InsightMed());
}
