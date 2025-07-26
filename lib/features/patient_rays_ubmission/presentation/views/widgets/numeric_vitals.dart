import 'package:flutter/material.dart';
import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class NumericVitals extends StatefulWidget {
  const NumericVitals({
    super.key,
    this.onChangTemperature,
    this.onChangSystolic,
    this.onChangDiastolic,
    this.onChangHeartRate,
  });
  final void Function(String?)? onChangTemperature;
  final void Function(String?)? onChangSystolic;
  final void Function(String?)? onChangDiastolic;
  final void Function(String?)? onChangHeartRate;

  @override
  State<NumericVitals> createState() => _NumericVitalsState();
}

class _NumericVitalsState extends State<NumericVitals> {
  @override
  Widget build(final BuildContext context) {
    const numericVitals = <String>[
      'Temperature (°C)',
      'Systolic BP (mmHg)',
      'Diastolic BP (mmHg)',
      'Heart Rate (bpm)',
    ];
    return decorationWidget(
      children: [
        Text(
          'Numeric Vitals',
          style: AppTextStyles.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(
          4,
          (final index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numericVitals[index],
                style: AppTextStyles.bodyLarge?.copyWith(
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 5),
              CTextField(
                choose: false,
                hint: 'Write ${numericVitals[index]}',
                onChanged: (final p0) {
                  if (index == 0) {
                    setState(() {
                      widget.onChangTemperature!(p0);
                    });
                  } else if (index == 1) {
                    setState(() {
                      widget.onChangSystolic!(p0);
                    });
                  } else if (index == 2) {
                    setState(() {
                      widget.onChangDiastolic!(p0);
                    });
                  } else {
                    setState(() {
                      widget.onChangHeartRate!(p0);
                    });
                  }
                },
                type: TextInputType.number,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
