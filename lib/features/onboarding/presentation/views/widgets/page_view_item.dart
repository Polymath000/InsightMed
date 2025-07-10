import 'package:flutter/material.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import 'onboarding_avatar_image.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    required this.title,
    required this.description,
    required this.image,
    super.key,
  });
  final String title;
  final String description;
  final String image;
  @override
  Widget build(final BuildContext context) => Align(
    child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              // TODO(Anyone): Navigate to the Login page
            },
            child: const IText(
              'Skip',
              style: TextStyle(fontSize: 16, color: AppColors.lightGrey),
            ),
          ),
        ),
        Stack(
          children: [
            const OnboardingAvatarImage(),
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage(image),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: IText(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: IText(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: AppColors.lightGrey),
          ),
        ),
      ],
    ),
  );
}
