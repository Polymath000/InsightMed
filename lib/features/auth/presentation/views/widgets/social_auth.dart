import 'package:flutter/material.dart';
import '../../../../../core/utls/app_images.dart';
import 'constans.dart';
import 'custbutton.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(final BuildContext context) => Column(
      children: [
         CButton(
              image: Assets.assetsImagesGoogleLogo,
              onTap: null,
              colorbackground: kBasicColor,
              btnText: 'Login with gmail',
              colorText: kSmain,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 91),
             CButton(
              onTap: null,
              image: Assets.assetsImagesFacebookLogo,
              colorbackground: kBasicColor,
              btnText: 'Login with facebook',
              colorText: kSmain,
            ),
      ],
    );
}