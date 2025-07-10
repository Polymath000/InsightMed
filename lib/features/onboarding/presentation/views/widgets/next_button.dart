import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  const NextButton({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.pageController.hasClients &&
            widget.pageController.page != null &&
            widget.pageController.page! < 2) {
          widget.pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }else if (widget.pageController.hasClients &&
            widget.pageController.page == 2) {
            // TODO: Navigate to the Login page
        }
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 105.05,
          height: 60,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 0.50),
              end: Alignment(1.00, 0.50),
              colors: [const Color(0xFF0891B2), const Color(0xFF2563EB)],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: const Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(9999),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 15,
                offset: Offset(0, 10),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 6,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: SizedBox(
            width: 42,
            height: 28,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.pageController.page == 2? 'Let\'s Go' : 'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
