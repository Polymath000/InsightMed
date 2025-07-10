import 'package:flutter/material.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

class InsightMed extends StatelessWidget {
  const InsightMed({super.key});

  @override
  Widget build(final BuildContext context) => const MaterialApp(
    onGenerateRoute: onGenerateRoute,
    initialRoute: OnboardingView.routeName,
    debugShowCheckedModeBanner: false,
  );
}
