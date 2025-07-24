import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/on_generate_routes.dart';
import 'widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        AnimatedTextKit(
          onTap: () => AppRoutes.login(context),
          displayFullTextOnTap: true,
          repeatForever: true,
          pause: const Duration(microseconds: 1000),
          animatedTexts: [
            FlickerAnimatedText('Skip'),
            FlickerAnimatedText('Skip'),
          ],
        ),
        const SizedBox(width: 12),
      ],
    ),
    body: const OnBoardingViewBody(),
  );
}
