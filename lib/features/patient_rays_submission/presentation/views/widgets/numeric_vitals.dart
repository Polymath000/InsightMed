import 'package:flutter/material.dart';

import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/widgets/app_text_field.dart';

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
  Widget build(final BuildContext context) => decorationWidget(
    children: [
      const Text(
        'Numeric Vitals',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      const SizedBox(height: 8),
      ...fields.map(
        (final field) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field.label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 4),
            AppTextField(
              hintText: 'Write ${field.label}',
              keyboardType: TextInputType.number,
              validator: (final value) {
                final val = value?.toInt();
                if (val == null) {
                  return 'Enter a valid number';
                }
                if (val < field.min || val > field.max) {
                  return 'must be between ${field.min} and ${field.max}';
                }
                return null;
              },
              onChanged: (final value) => field.onChanged?.call(value),
            ),
          ],
        ),
      ),
    ],
  );
}

class _VitalFieldData {
  _VitalFieldData({
    required this.label,
    required this.min,
    required this.max,
    required this.onChanged,
  });
  final String label;
  final int min;
  final int max;
  final void Function(String?)? onChanged;
}
