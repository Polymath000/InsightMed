import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utls/app_images.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'constans.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => AuthCubit(),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: kBasicColor,
        border: Border.all(color: const Color(0xffD1D5DB)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          splashColor: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(Assets.assetsImagesGoogleLogo),
                ),
                const Text(
                  'Login with gmail',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
