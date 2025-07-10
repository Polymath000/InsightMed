import 'package:flutter/material.dart';

class OnboardingAvatarImage extends StatelessWidget {
  const OnboardingAvatarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [const Color(0xFFCFFAFE), const Color(0xFFDBEAFE)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(9999),
        ),
      ),
    );
  }
}
