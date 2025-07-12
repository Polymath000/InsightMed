import 'package:flutter/material.dart';
import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_text_style.dart';

class NumericVitals extends StatelessWidget {
  const NumericVitals({super.key});

  @override
  Widget build(final BuildContext context) {  
    const numericVitals = <String>[
    'Temperature (°C)',
    'Heart Rate (bpm)',
    'Blood Pressure (mmHg)',
    'Diastolic BP (mmHg)',
  ];
    return           decorationWidget(            
            children: [
              Text(
                'Numeric Vitals',
                style: AppTextStyles.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 8),
              ...List.generate(4, (final index) =>  Column(
                children: [
                  Text(
                    numericVitals[index],
                    style: AppTextStyles.bodyLarge?.copyWith(
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  // TODO: Replace with actual input widget (CustomTextField)
                ],
              )),
            ],
          );
  }
}
