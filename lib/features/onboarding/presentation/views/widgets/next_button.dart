import 'package:flutter/material.dart';

import '../../../../auth/presentation/views/login_view.dart';
import 'nextbutton_shape_decoration.dart';

class NextButton extends StatefulWidget {
  const NextButton({required this.pageController, super.key});
  final PageController pageController;

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.90;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(final BuildContext context) {
    final double currentPage = widget.pageController.hasClients
        ? (widget.pageController.page ?? 0)
        : 0;
    final bool isLastPage = currentPage == 2;

    return GestureDetector(
      onTap: () async {
        if (widget.pageController.hasClients && currentPage < 2) {
          await widget.pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else if (isLastPage) {
          await Navigator.pushNamed(context, LoginScreen.routeName);
        }
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 105.05,
              height: 60,
              decoration: nextbuttonShapeDecoration,
              child: SizedBox(
                width: 42,
                height: 28,
                child: Align(
                  child: Text(
                    isLastPage ? "Let's Go" : 'Next',
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
      ),
    );
  }
}
