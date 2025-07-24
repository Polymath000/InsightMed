import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/constants.dart';

class AnimatedTextSignUp extends StatelessWidget {
  const AnimatedTextSignUp({super.key});

  @override
  Widget build(final BuildContext context) => AnimatedTextKit(
    pause: Duration.zero,
    repeatForever: true,
    animatedTexts: [
      ColorizeAnimatedText(
        'Sign up to get started with our service',
        colors: animatedTextColors,
        textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
      ),
      ColorizeAnimatedText(
        'Sign up to get started with our service',
        colors: animatedTextColors,
        textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
      ),
      ColorizeAnimatedText(
        'Sign up to get started with our service',
        colors: animatedTextColors,
        textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
      ),
    ],
  );
}
