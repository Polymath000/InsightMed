import 'package:flutter/material.dart';

import '../../../../core/helpers/shape_decoration.dart';
import '../../../../core/utls/themes/app_colors.dart';
import '../../../../core/utls/themes/app_text_style.dart';

class ApptsView extends StatelessWidget {
  const ApptsView({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 25),

    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: shapeDecoration,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 60,
            decoration: ShapeDecoration(
              color: const Color(0xFFF1F5F9),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                const Text('Jul'),
                Text(
                  '05',
                  style: AppTextStyles.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '10:30 AM - 11:15 AM',
            style: AppTextStyles.bodyLarge!.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    ),
  );
}
