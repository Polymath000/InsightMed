import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utls/app_images.dart';

class TopLoginView extends StatelessWidget {
  const TopLoginView({super.key});
  @override
  Widget build(final BuildContext context) => Column(
    children: [
      const SizedBox(height: 96),
      const CircleAvatar(
        radius: 96,
        backgroundImage: AssetImage(Assets.assetsImagesLogo),
      ),
      const SizedBox(height: 12),
      const Text(
        'Welcome Back!',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      ),
      const SizedBox(height: 12),
      AnimatedTextKit(
        pause: Duration.zero,
        repeatForever: true,
        animatedTexts: [
          ColorizeAnimatedText(
            'Sign in to continue',
            colors: animatedTextColors,
            textStyle: const TextStyle(fontSize: 18),
          ),
          ColorizeAnimatedText(
            'Sign in to continue',
            colors: animatedTextColors,
            textStyle: const TextStyle(fontSize: 18),
          ),
          ColorizeAnimatedText(
            'Sign in to continue',
            colors: animatedTextColors,
            textStyle: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ],
  );
}
