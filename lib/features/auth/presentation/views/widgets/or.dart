import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constans.dart';

class OR extends StatelessWidget {
  const OR({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "OR",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: kOR,
      ),
    );
  }
}
