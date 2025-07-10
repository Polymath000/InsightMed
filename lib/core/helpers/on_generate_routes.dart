import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(final RouteSettings settings) =>
    switch (settings.name) {
      OnboardingView.routeName => MaterialPageRoute(
        builder: (_) => const OnboardingView(),
      ),

      _ => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
      ),
    };
