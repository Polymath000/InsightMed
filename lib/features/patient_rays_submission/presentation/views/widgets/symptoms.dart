import 'package:flutter/material.dart';

import '../../../../../core/helpers/decoration_widget.dart';
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
      const Text(
        'Symptoms',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            CustomCheckBox(onChanged: onChangHasCough),
            const SizedBox(width: 16),
            const Text(
              'Has cough',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
            const Text(
              'Can smell/taste food',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
            const Text(
              'Has headache',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    ],
  );
}
