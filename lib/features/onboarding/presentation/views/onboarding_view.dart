import 'package:flutter/material.dart';
import 'widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        TextButton(
          onPressed: () {
            // TODO(Anyone): Navigate to the Login page
          },
          child: const Text('Skip'),
        ),
        const SizedBox(width: 12),
      ],
    ),
    body: const SafeArea(child: OnBoardingViewBody()),
  );
}
