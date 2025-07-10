import 'package:flutter/material.dart';
import 'package:insight_med/core/utls/app_color.dart';
import 'package:insight_med/features/onboarding/presentation/views/widgets/onboarding_avatar_image.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.description,
    required this.image ,
  });
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                            // TODO: Navigate to the Login page

              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(AppColors.lightGray),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              OnboardingAvatarImage(),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(image),
                )
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Color(AppColors.black),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(AppColors.lightGray)),
            ),
          ),
        ],
      ),
    );
  }
}
