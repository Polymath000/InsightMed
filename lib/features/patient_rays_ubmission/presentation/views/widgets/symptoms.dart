import 'package:flutter/material.dart';
import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custom_checkbox.dart';

class Symptoms extends StatelessWidget {
   const Symptoms({super.key});
  static List<String> symptomsList = [
    'Has cough',
    'Can smell/taste food',
    'Has headache',
  ];
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
                ...List.generate(3,
                (final index) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    
                    children: [
                      CustomCheckBox(
                        onChanged: (final value) {
                          // Handle checkbox state change
                        },
                      ),
                      const SizedBox(width: 16),
                      Text(
                        symptomsList[index],
                        style: AppTextStyles.titleMedium?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                    
                  ),
                ),
                 ),

              ],
            );
}
