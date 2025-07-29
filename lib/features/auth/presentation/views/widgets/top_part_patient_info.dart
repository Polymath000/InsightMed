import 'package:flutter/material.dart';

import '../../../../../core/constants/borders.dart';
import '../../../../../core/utls/themes/app_colors.dart';

class TopPartPatientInfo extends StatelessWidget {
  const TopPartPatientInfo({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    // spacing: 8,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Step 1/1', style: TextStyle(color: AppColors.primary)),
          const Text(
            'Initial Information',
            style: TextStyle(color: AppColors.grey),
          ),
        ],
      ),
      const LinearProgressIndicator(
        value: 1,
        borderRadius: AppBorders.xxs,
        minHeight: 8,
      ),
      const SizedBox(height: 12),
      const Text(
        'Please provide your basic information to get started. '
        'Field marked with * are required',
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}
