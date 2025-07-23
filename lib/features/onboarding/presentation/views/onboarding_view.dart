import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../auth/presentation/views/login_view.dart';
import 'widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        AnimatedTextKit(
          onTap: () async {
            await Navigator.of(
              context,
            ).pushReplacementNamed(LoginScreen.routeName);
          },
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
