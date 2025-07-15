import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utls/app_images.dart';

class TopLoginView extends StatelessWidget {
  const TopLoginView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
      children: [
        const Image(image: AssetImage(Assets.assetsImagesLogo)),
        SizedBox(height: MediaQuery.of(context).size.height / 30),
        Text(
          'Welcome',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 85),
        Text(
          'Sign in to continue',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
}
