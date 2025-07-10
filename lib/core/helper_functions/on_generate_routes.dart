import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(final RouteSettings settings) {
  switch (settings.name) {
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (final context) => const OnboardingView(),
      );

    default:
      return MaterialPageRoute(
        builder: (final context) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
