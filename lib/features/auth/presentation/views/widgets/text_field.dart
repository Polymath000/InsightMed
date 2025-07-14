import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constans.dart';

class CTextField extends StatelessWidget {
  const CTextField({required this.choose, super.key, this.hinto, this.type, this.onChanged});
  final String? hinto;
  final bool? choose;
  final TextInputType? type;
  final void Function(String?)? onChanged;
  @override
  Widget build(final BuildContext context) => TextFormField(
    onChanged: onChanged,
      validator: (final value) {
        if (value == null || value.isEmpty) { 
          return 'this field is required';
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: type,
      obscureText: choose!,
      decoration: InputDecoration(
        hintText: hinto,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: Color(0xffADAEBC),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
      ),
    );
}
