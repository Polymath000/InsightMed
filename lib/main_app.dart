import 'package:flutter/material.dart';
import 'package:insight_med/core/helper_functions/on_generate_routes.dart';
import 'package:insight_med/features/onboarding/presentation/views/onboarding_view.dart';

class InsightMed extends StatelessWidget {
  const InsightMed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      initialRoute: OnboardingView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
