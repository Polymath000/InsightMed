import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utls/themes/app_text_style.dart';

class CustomAnimatedTextKit extends StatelessWidget {
  const CustomAnimatedTextKit({required this.title, super.key});
  final String title;
  @override
  Widget build(final BuildContext context) => AnimatedTextKit(
    pause: Duration.zero,
    repeatForever: true,
    animatedTexts: [
      ColorizeAnimatedText(
        title,
        colors: animatedTextColors,
        textStyle: AppTextStyles.headlineLarge ?? const TextStyle(),
      ),
      ColorizeAnimatedText(
        title,
        colors: animatedTextColors,
        textStyle: AppTextStyles.headlineLarge ?? const TextStyle(),
      ),
      ColorizeAnimatedText(
        title,
        colors: animatedTextColors,
        textStyle: AppTextStyles.headlineLarge ?? const TextStyle(),
      ),
    ],
  );
}
