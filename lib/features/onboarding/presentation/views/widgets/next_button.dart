import 'package:flutter/material.dart';

import '../../../../../core/utls/i_text.dart';

class NextButton extends StatelessWidget {
  const NextButton({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(final BuildContext context) =>
      // Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: FilledButton(
      //     onPressed: () async {
      //       if (pageController.hasClients &&
      //           pageController.page != null &&
      //           pageController.page! < 2) {
      //         await pageController.nextPage(
      //           duration: const Duration(milliseconds: 300),
      //           curve: Curves.easeInOut,
      //         );
      //       } else if (pageController.hasClients && pageController.page == 2) {
      //         // TODO(Anyone): Navigate to the Login page
      //       }
      //     },
      //     child: IText(pageController.page == 2 ? "Let's Go" : 'Next'),
      //   ),
      // );
      GestureDetector(
        onTap: () async {
          if (pageController.hasClients &&
              pageController.page != null &&
              pageController.page! < 2) {
            await pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else if (pageController.hasClients && pageController.page == 2) {
            // TODO(Anyone): Navigate to the Login page
          }
        },
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 105.05,
              height: 60,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0, 0.50),
                  end: Alignment(1, 0.50),
                  colors: [Color(0xFF0891B2), Color(0xFF2563EB)],
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(9999),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 15,
                    offset: Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SizedBox(
                width: 42,
                height: 28,
                child: Align(
                  child: IText(
                    pageController.page == 2 ? "Let's Go" : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
