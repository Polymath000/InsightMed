import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/patient_info_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/patient_details/presentation/view/patient_details_view.dart';
import '../../features/patient_rays_submission/presentation/views/upload_medical_ray_view.dart';
import '../../features/reset_password/presntation/view/create_new_password.dart';
import '../../features/reset_password/presntation/view/loading_view.dart';
import '../../features/reset_password/presntation/view/reset_password_view.dart';
import '../../features/reset_password/presntation/view/verify_code.dart';
import '../entities/user_entity.dart';
import '../utls/i_text.dart';

sealed class AppRoutes {
  const AppRoutes();
  static void pop<T extends Object?>(
    final BuildContext context, [
    final T? result,
  ]) => Navigator.pop<T>(context);

  static Future<T?> _pushNamed<T extends Object?>(
    final BuildContext context,
    final String routeName, {
    final Object? arguments,
  }) => Navigator.pushNamed<T>(context, routeName, arguments: arguments);

  static Future<T?> _pushNamedAndRemoveAll<T extends Object?>(
    final BuildContext context,
    final String newRouteName, {
    final Object? arguments,
  }) => Navigator.pushNamedAndRemoveUntil<T>(
    context,
    newRouteName,
    (_) => false,
    arguments: arguments,
  );

  // Routes with arguments
  static Future<T?> patientInformation<T extends Object?>(
    final BuildContext context, {
    required final UserEntity user,
  }) => _pushNamed<T>(context, PatientInformation.routeName, arguments: user);

  static Future<T?> patientDetails<T extends Object?>(
    final BuildContext context, {
    required final UserEntity patient,
  }) =>
      _pushNamed<T>(context, PatientDetailsView.routeName, arguments: patient);

  static Future<Object?> vrerifyCodeView(
    final BuildContext context, {
    required final String email,
  }) => _pushNamed(context, VerifyCodeView.routeName, arguments: email);

  static Future<Object?> loadingView(
    final BuildContext context, {
    required final String email,
    required final String password,
  }) => _pushNamed(
    context,
    LoadingView.routeName,
    arguments: LoadingViewArgs(email: email, password: password),
  );

  static Future<Object?> createNewPasswordView(
    final BuildContext context, {
    required final String email,
    required final String code,
  }) => _pushNamed(
    context,
    CreateNewPasswordView.routeName,
    arguments: CreateNewPasswordView(email: email, code: code),
  );
  // Routes without arguments
  static Future<Object?> main(final BuildContext context) =>
      _pushNamedAndRemoveAll(context, MainView.routeName);

  static Future<Object?> login(final BuildContext context) =>
      _pushNamedAndRemoveAll(context, LoginScreen.routeName);

  static Future<Object?> signUp(final BuildContext context) =>
      _pushNamed(context, SignUpScreen.routeName);

  static Future<Object?> resetPasswordView(final BuildContext context) =>
      _pushNamed(context, ResetPasswordView.routeName);

  static Future<Object?> uploadMedicalRay(final BuildContext context) =>
      _pushNamed(context, UploadMedicalRayView.routeName);
}

Map<String, Widget Function(BuildContext, Object?)> _routes = {
  MainView.routeName: (_, _) => const MainView(),
  OnboardingView.routeName: (_, _) => const OnboardingView(),
  LoginScreen.routeName: (_, _) => const LoginScreen(),
  SignUpScreen.routeName: (_, _) => const SignUpScreen(),
  PatientInformation.routeName: (_, final args) =>
      PatientInformation(user: args! as UserEntity),
  UploadMedicalRayView.routeName: (_, _) => const UploadMedicalRayView(),
  PatientDetailsView.routeName: (_, final args) =>
      PatientDetailsView(patient: args! as UserEntity),
  ResetPasswordView.routeName: (_, _) => ResetPasswordView(),
  VerifyCodeView.routeName: (_, final args) =>
      VerifyCodeView(email: args! as String),
  CreateNewPasswordView.routeName: (_, final args) {
    final data = args! as CreateNewPasswordViewArgs;
    return CreateNewPasswordView(email: data.email, code: data.code);
  },
  LoadingView.routeName: (_, final args) {
    final data = args! as LoadingViewArgs;
    return LoadingView(email: data.email, password: data.password);
  },
};

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (final settings) {
  final builder =
      _routes[settings.name] ??
      (_, _) => const Scaffold(body: Center(child: IText('Page not found')));
  return MaterialPageRoute(
    builder: (final context) => builder(context, settings.arguments),
    settings: settings,
  );
};
