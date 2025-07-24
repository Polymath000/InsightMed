import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingTextProfileEdit extends StatelessWidget {
  const HeadingTextProfileEdit({super.key, this.head});
  final String? head;
  @override
  Widget build(final BuildContext context) => Text(
    head!,
    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
  );
}
