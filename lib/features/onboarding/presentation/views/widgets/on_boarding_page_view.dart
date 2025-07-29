import 'package:flutter/material.dart';
import '../../../../../core/utls/app_images.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({required this.pageController, super.key});
  final PageController pageController;
  @override
  Widget build(final BuildContext context) => PageView(
    controller: pageController,
    children: const [
      PageViewItem(
        title: 'Care for Clinicians',
        description:
            'The app caters to both medical professionals and patients, '
            'teasing the specific benefits for each.',
        image: Assets.assetsImagesOnboarding1,
      ),
      PageViewItem(
        title: 'Bridging Care with AI',
        description:
            'Introduces the app as a modern solution for healthcare management.'
            '\n'
            'It highlights the blend of human care and AI efficiency.',
        image: Assets.assetsImagesOnboarding2,
      ),
      PageViewItem(
        title: 'AI-Powered Insights',
        description:
            ' Focuses on the cutting-edge AI functionality, '
            'specifically for medical imaging and its benefits for both doctors'
            ' (summaries, notes) and patients.',
        image: Assets.assetsImagesOnboarding3,
      ),
    ],
  );
}
