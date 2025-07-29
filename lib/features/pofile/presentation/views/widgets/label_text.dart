import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({required this.labelText, super.key});
  final String? labelText;
  @override
  Widget build(final BuildContext context) => Row(
    children: [
      Text(
        labelText!,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
      ),
    ],
  );
}
