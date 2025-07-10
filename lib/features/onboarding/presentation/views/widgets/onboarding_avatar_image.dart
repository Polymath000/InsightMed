import 'package:flutter/material.dart';

class OnboardingAvatarImage extends StatelessWidget {
  const OnboardingAvatarImage({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    width: 320,
    height: 320,
    decoration: ShapeDecoration(
      gradient: const LinearGradient(
        begin: Alignment(0, 0.50),
        end: Alignment(1, 0.50),
        colors: [Color(0xFFCFFAFE), Color(0xFFDBEAFE)],
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(9999),
      ),
    ),
  );
}
