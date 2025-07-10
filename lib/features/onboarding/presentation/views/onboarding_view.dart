import 'package:flutter/material.dart';
import '../../../main/presentation/views/main_view.dart';
import 'widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        TextButton(
          onPressed: () async {
            await Navigator.of(
              context,
            ).pushReplacementNamed(MainView.routeName);
            // TODO(Anyone): Navigate to the Login page
          },
          child: const Text('Skip'),
        ),
        const SizedBox(width: 12),
      ],
    ),
    body: const OnBoardingViewBody(),
  );
}
