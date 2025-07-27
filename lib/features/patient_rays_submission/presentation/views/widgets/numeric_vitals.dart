import 'package:flutter/material.dart';
import '../../../../../core/extensions/string_extension.dart';
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
  late final List<_VitalFieldData> fields;

  @override
  void initState() {
    super.initState();
    fields = [
      _VitalFieldData(
        label: 'Temperature (°C)',
        min: 30,
        max: 45,
        onChanged: widget.onChangTemperature,
      ),
      _VitalFieldData(
        label: 'Systolic BP (mmHg)',
        min: 70,
        max: 200,
        onChanged: widget.onChangSystolic,
      ),
      _VitalFieldData(
        label: 'Diastolic BP (mmHg)',
        min: 40,
        max: 130,
        onChanged: widget.onChangDiastolic,
      ),
      _VitalFieldData(
        label: 'Heart Rate (bpm)',
        min: 40,
        max: 200,
        onChanged: widget.onChangHeartRate,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => decorationWidget(
    children: [
      Text(
        'Numeric Vitals',
        style: AppTextStyles.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F2937),
        ),
      ),
      const SizedBox(height: 8),
      ...fields.map(
        (field) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field.label,
              style: AppTextStyles.bodyLarge?.copyWith(
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 5),
            CustomTextField(
              choose: false,
              hint: 'Write ${field.label}',
              type: TextInputType.number,
              validator: (value) {
                final val = value?.toInt();
                if (val == null) return 'Enter a valid number';
                if (val < field.min || val > field.max) {
                  return 'must be between ${field.min} and ${field.max}';
                }
                return null;
              },
              onChanged: (value) => field.onChanged?.call(value),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    ],
  );
}

class _VitalFieldData {
  final String label;
  final int min;
  final int max;
  final void Function(String?)? onChanged;

  _VitalFieldData({
    required this.label,
    required this.min,
    required this.max,
    required this.onChanged,
  });
}
