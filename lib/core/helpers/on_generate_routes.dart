import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/patient_info_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/patient_details.dart/presentation/view/patient_details_view.dart';
import '../../features/patient_rays_ubmission/presentation/views/upload_medical_ray_view.dart';
import '../entities/user_entity.dart';
import '../utls/i_text.dart';
import 'patient_info_screen_arguments.dart';

sealed class AppRoutes {
  const AppRoutes();
  static void pop<T extends Object?>(
    final BuildContext context, [
    final T? result,
  ]) => Navigator.pop(context);

  static Future<T?> _pushNamed<T extends Object?>(
    final BuildContext context,
    final String routeName, {
    final Object? arguments,
  }) => Navigator.pushNamed(context, routeName, arguments: arguments);

  static Future<T?> _pushNamedAndRemoveAll<T extends Object?>(
    final BuildContext context,
    final String newRouteName, {
    final Object? arguments,
  }) => Navigator.pushNamedAndRemoveUntil(
    context,
    newRouteName,
    (_) => false,
    arguments: arguments,
  );

  // Routes with arguments
  static Future<Object?> patientInformation(
    final BuildContext context, {
    final UserEntity? user,
  }) => _pushNamed(context, PatientInformation.routeName, arguments: user);

  // Routes without arguments

  static Future<Object?> main(final BuildContext context) =>
      _pushNamedAndRemoveAll(context, MainView.routeName);

  static Future<Object?> login(final BuildContext context) =>
      _pushNamedAndRemoveAll(context, LoginScreen.routeName);

  static Future<Object?> signUp(final BuildContext context) =>
      _pushNamed(context, SignUpScreen.routeName);

  static Future<Object?> uploadMedicalRay(final BuildContext context) =>
      _pushNamed(context, UploadMedicalRayView.routeName);

  static Future<Object?> patientDetails(final BuildContext context) =>
      _pushNamed(context, PatientDetailsView.routeName);
}

Map<String, Widget Function(BuildContext, Object?)> _routes = {
  MainView.routeName: (_, _) => const MainView(),
  OnboardingView.routeName: (_, _) => const OnboardingView(),
  LoginScreen.routeName: (_, _) => LoginScreen(),
  SignUpScreen.routeName: (_, _) => const SignUpScreen(),
  PatientInformation.routeName: (_, final args) =>
      PatientInformation(user: args! as UserEntity),
  UploadMedicalRayView.routeName: (_, _) => const UploadMedicalRayView(),
  PatientDetailsView.routeName: (_, _) => const PatientDetailsView(),
};

Route<dynamic> onGenerateRoute(final RouteSettings settings) {
  final builder =
      _routes[settings.name] ??
      (_, _) => const Scaffold(body: Center(child: IText('Page not found')));
  return MaterialPageRoute(
    builder: (final context) => builder(context, settings.arguments),
    settings: settings,
  );
}
