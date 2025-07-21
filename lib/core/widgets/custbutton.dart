import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CButton extends StatelessWidget {
   CButton({
    required this.btnText, required this.onTap, super.key,
    this.colorbackground,
    this.colorText,
    this.image ,
  });
  final Color? colorbackground;
  final String? btnText;
  final Color? colorText;
  final void Function()? onTap;
  String? image ;
  @override
  Widget build(final BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorbackground,
          border: Border.all(color: const Color(0xffD1D5DB)),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 38.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image == null) const SizedBox(width: 1,) else Padding(
              padding: const EdgeInsets.only(right:  16),
              child: SvgPicture.asset(image?? ''),
            ),
            Text(
              btnText!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
}
