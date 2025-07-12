import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => GestureDetector(
      onTap: ()  {
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 28),
        
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFFF9FAFB),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.folder,
              size: 48,
              color: AppColors.grey,
            ),
            Text(
              'Drag & Drop or Browse Files',
              style: AppTextStyles.bodyLarge?.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Browse Files',
              style: AppTextStyles.bodyLarge?.copyWith(
                color: AppColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
}
