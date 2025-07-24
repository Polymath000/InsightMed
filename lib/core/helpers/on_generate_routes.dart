import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/patient_info_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home_patient_view/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/patient_details.dart/presentation/view/patient_details_view.dart';
import '../../features/patient_rays_ubmission/presentation/views/upload_medical_ray_view.dart';
import '../../features/pofile_view/profile_view.dart';
import '../utls/i_text.dart';

Route<dynamic> onGenerateRoute(final RouteSettings settings) =>
    switch (settings.name) {
      MainView.routeName => MaterialPageRoute(builder: (_) => const MainView()),

      OnboardingView.routeName => MaterialPageRoute(
        builder: (_) => const OnboardingView(),
      ),
      HomeView.routeName => MaterialPageRoute(builder: (_) => const HomeView()),
      LoginScreen.routeName => MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
      SignUpScreen.routeName => MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      ),
      PatientInformation.routeName => MaterialPageRoute(
        builder: (_) => const PatientInformation(),
        settings: settings,
      ),
      UploadMedicalRayView.routeName => MaterialPageRoute(
        builder: (_) => const UploadMedicalRayView(),
      ),
      PatientDetailsView.routeName => MaterialPageRoute(
        builder: (_) => const PatientDetailsView(),
      ),
      ProfileView.routeName => MaterialPageRoute(
        builder: (_) => const ProfileView(),
      ),
      _ => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: IText('Page not found'))),
      ),
    };
