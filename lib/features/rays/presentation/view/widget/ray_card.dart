import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/shape_decoration.dart';
import '../../../../../core/utls/app_images.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custom_linear_percent_indicator.dart';
import 'differential_diagnosis_widget.dart';

class RayCard extends StatelessWidget {
  const RayCard({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    decoration: shapeDecoration,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.assetsImagesRay1),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Chest X-Ray 1',
                      style: AppTextStyles.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 50),

                    Container(
                      width: 65,
                      height: 25,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(24, 12, 224, 154),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFFE5E7EB)),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 42,
                          height: 16,
                          child: Text(
                            'Normal',
                            style: TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Uploaded: June 15, 2023',
                  style: AppTextStyles.bodyMedium,
                ),
                Text(
                  'Confidence Level',
                  style: AppTextStyles.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const CustomLinearPercentIndicator(
                  color: AppColors.green,
                  percent: 0.8,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Patchy opacities in right lower lobe consistent with pneumonia.'
          ' Recommend clinical correlation.',
          style: AppTextStyles.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        const DifferentialDiagnosisWidget(),
      ],
    ),
  );
}
