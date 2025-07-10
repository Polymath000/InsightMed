import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/borders.dart';
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
        child: CircleAvatar(radius: 150, backgroundImage: AssetImage(image)),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 90.sp),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp, color: AppColors.darkGrey),
        ),
      ),
    ],
  );
}
