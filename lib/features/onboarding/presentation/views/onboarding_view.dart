import 'package:flutter/material.dart';
import 'package:insight_med/features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
 static const routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: OnBoardingViewBody(),
        ),
      ),
    );
  }
}
