import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'next_button.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      Expanded(child: OnBoardingPageView(pageController: _pageController)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (final index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: _currentPage == index ? 20.sp : 10.sp,
            height: 10,
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      NextButton(
        pageController: _pageController
        ),
    ],
  );
}
