import 'package:flutter/material.dart';
import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custom_checkbox.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({
    required this.onChangHasCough,
    required this.onChangCanSmell,
    required this.onChangHasHeadache,
    super.key,
  });

  final void Function(bool) onChangHasCough;
  final void Function(bool) onChangCanSmell;
  final void Function(bool) onChangHasHeadache;

  @override
  Widget build(final BuildContext context) => decorationWidget(
    children: [
      Text(
        'Symptoms',
        style: AppTextStyles.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F2937),
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            CustomCheckBox(onChanged: onChangHasCough),
            const SizedBox(width: 16),
            Text(
              'Has cough',
              style: AppTextStyles.titleMedium?.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            CustomCheckBox(onChanged: onChangCanSmell),
            const SizedBox(width: 16),
            Text(
              'Can smell/taste food',
              style: AppTextStyles.titleMedium?.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            CustomCheckBox(onChanged: onChangHasHeadache),
            const SizedBox(width: 16),
            Text(
              'Has headache',
              style: AppTextStyles.titleMedium?.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
