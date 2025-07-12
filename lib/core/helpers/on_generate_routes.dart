import 'package:flutter/material.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/patient_rays_ubmission/presentation/views/upload_medical_ray_view.dart';
import '../utls/i_text.dart';

Route<dynamic> onGenerateRoute(final RouteSettings settings) =>
    switch (settings.name) {
      MainView.routeName => MaterialPageRoute(builder: (_) => const MainView()),

      OnboardingView.routeName => MaterialPageRoute(
        builder: (_) => const OnboardingView(),
      ),
      HomeView.routeName => MaterialPageRoute(
        builder: (_) => const HomeView(),
      ),
            UploadMedicalRayView.routeName => MaterialPageRoute(
        builder: (_) => const UploadMedicalRayView(),
      ),
      
      _ => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: IText('Page not found'))),
      ),
    };
