import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custom_linear_percent_indicator.dart';

class DifferentialDiagnosisWidget extends StatelessWidget {
  const DifferentialDiagnosisWidget({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      Align(
        alignment: Alignment.topLeft,

        child: Text('Differential Diagnosis', style: AppTextStyles.titleLarge),
      ),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.topLeft,
        child: Text('Pneumonia', style: AppTextStyles.bodyLarge),
      ),
      const CustomLinearPercentIndicator(color: AppColors.blue, percent: 0.8),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.topLeft,
        child: Text('Infiltration', style: AppTextStyles.bodyLarge),
      ),
      const CustomLinearPercentIndicator(color: AppColors.blue, percent: 0.2),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.topLeft,
        child: Text('Nodule', style: AppTextStyles.bodyLarge),
      ),
      const CustomLinearPercentIndicator(color: AppColors.blue, percent: 0.3),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.topLeft,
        child: Text('Atelectasis', style: AppTextStyles.bodyLarge),
      ),
      const CustomLinearPercentIndicator(color: AppColors.blue, percent: 0.9),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.topLeft,
        child: Text('Normal', style: AppTextStyles.bodyLarge),
      ),
      const CustomLinearPercentIndicator(color: AppColors.blue, percent: 0.5),
    ],
  );
}
