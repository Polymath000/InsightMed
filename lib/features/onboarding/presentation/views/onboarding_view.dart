import 'package:flutter/material.dart';
import 'widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(final BuildContext context) => const Scaffold(
    body: SafeArea(
      child: Padding(padding: EdgeInsets.all(20), child: OnBoardingViewBody()),
    ),
  );
}
