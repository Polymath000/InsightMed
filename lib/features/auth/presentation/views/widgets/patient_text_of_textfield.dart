import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constans.dart';

class PatientTextOfTextField extends StatelessWidget {
  const PatientTextOfTextField({required this.text, super.key});
  final String? text;
  @override
  Widget build(final BuildContext context) => Row(
    children: [
      Text(
        text!,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: kSmain,
        ),
      ),
    ],
  );
}
