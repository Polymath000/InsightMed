import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingTextProfileEdit extends StatelessWidget {
  const HeadingTextProfileEdit({super.key, this.head});
  final String? head;
  @override
  Widget build(final BuildContext context) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          head!,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
      ),
    ],
  );
}
