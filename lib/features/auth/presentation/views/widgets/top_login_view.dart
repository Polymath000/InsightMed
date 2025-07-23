import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utls/app_images.dart';

class TopLoginView extends StatelessWidget {
  TopLoginView({super.key});
  @override
  Widget build(final BuildContext context) => Column(
    children: [
      SizedBox(height: MediaQuery.of(context).size.height / 50),

      const Image(image: AssetImage(Assets.assetsImagesLogo)),
      SizedBox(height: MediaQuery.of(context).size.height / 125),
      Text(
        'Welcome',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
      ),
      SizedBox(height: MediaQuery.of(context).size.height / 85),
      AnimatedTextKit(
        pause: Duration.zero,

        repeatForever: true,
        animatedTexts: [
          ColorizeAnimatedText(
            'Sign in to continue',
            colors: animatedTextColors,
            textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
          ),
          ColorizeAnimatedText(
            'Sign in to continue',
            colors: animatedTextColors,
            textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
          ),
          ColorizeAnimatedText(
            'Sign in to continue',
            colors: animatedTextColors,
            textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
          ),
        ],
      ),
    ],
  );
}
