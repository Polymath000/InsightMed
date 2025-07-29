import 'package:flutter/material.dart';

import '../../../../../core/constants/borders.dart';
import '../../../../../core/utls/themes/app_colors.dart';
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
        children: [
          const Spacer(),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (final index) => GestureDetector(
                  onTap: () => _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: _currentPage == index ? 24 : 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.primaryContainer
                          : Colors.grey,
                      borderRadius: AppBorders.xxxs,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(child: NextButton(pageController: _pageController)),
        ],
      ),
    ],
  );
}
