import 'package:flutter/material.dart';
import 'package:insight_med/features/onboarding/presentation/views/widgets/next_button.dart';
import 'package:insight_med/features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
    late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          )
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: currentPage == index ? 20 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),
        NextButton(
          pageController: pageController,
        ),
      ],
    );
  }
}
