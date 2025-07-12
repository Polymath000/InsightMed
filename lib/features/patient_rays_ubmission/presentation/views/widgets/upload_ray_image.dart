import 'package:flutter/material.dart';
import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import 'upload_widget.dart';

class UploadRayImage extends StatelessWidget {
  const UploadRayImage({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => decorationWidget(
        children: [
          Text(
            'Upload Ray Image',
            style: AppTextStyles.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'JPG, PNG, or PDF formats accepted',
            style: AppTextStyles.bodyLarge?.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          const UploadWidget(),
        ],
    );

}
