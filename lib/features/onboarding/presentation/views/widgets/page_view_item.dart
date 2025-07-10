import 'package:flutter/material.dart';
import '../../../../../core/constants/borders.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/utls/themes/app_colors.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    required this.title,
    required this.description,
    required this.image,
    super.key,
  });
  final String title;
  final String description;
  final String image;
  @override
  Widget build(final BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 12,
    children: [
      const SizedBox(height: 24),
      DecoratedBox(
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, 0.50),
            end: Alignment(1, 0.50),
            colors: [Color(0xFFCFFAFE), Color(0xFFDBEAFE)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFE5E7EB)),
            borderRadius: AppBorders.circular,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: CircleAvatar(radius: 150, backgroundImage: AssetImage(image)),
        ),
      ),
      const SizedBox(height: 12),
      IText(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: IText(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: AppColors.darkGrey),
          softWrap: true,
        ),
      ),
    ],
  );
}
