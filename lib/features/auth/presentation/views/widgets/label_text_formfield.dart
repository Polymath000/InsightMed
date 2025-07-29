import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, this.labelText});
  final String? labelText;
  @override
  Widget build(final BuildContext context) => Row(
      children: [
        Text(
          labelText!,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
}
