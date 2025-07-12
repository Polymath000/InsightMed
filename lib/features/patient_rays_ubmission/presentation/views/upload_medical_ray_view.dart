import 'package:flutter/material.dart';

import '../../../../core/utls/themes/app_colors.dart';
import '../../../../core/utls/themes/app_text_style.dart';
import 'widgets/upload_medical_ray_view_body.dart';

class UploadMedicalRayView extends StatelessWidget {
  const UploadMedicalRayView({super.key});
  static const String routeName = 'upload_medical_ray';
  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFE5E7EB)),
            ),
        backgroundColor: AppColors.white,
        shadowColor: AppColors.black,
        surfaceTintColor: AppColors.grey,
        title:  Text(
          'Upload Medical Ray',
          style: AppTextStyles.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          ),
      ),
      body:  const UploadMedicalRayViewBody(),
    );
}
