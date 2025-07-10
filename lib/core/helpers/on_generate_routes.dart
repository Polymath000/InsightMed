import 'package:flutter/material.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../utls/i_text.dart';

Route<dynamic> onGenerateRoute(final RouteSettings settings) =>
    switch (settings.name) {
      MainView.routeName => MaterialPageRoute(builder: (_) => const MainView()),

      OnboardingView.routeName => MaterialPageRoute(
        builder: (_) => const OnboardingView(),
      ),

      _ => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: IText('Page not found'))),
      ),
    };
