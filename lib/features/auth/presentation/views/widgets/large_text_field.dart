import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constans.dart';

class CLargeTextField extends StatelessWidget {
  const CLargeTextField({super.key, this.hinto, this.choose, this.type});
  final String? hinto;
  final bool? choose;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.width / 3,
      child: TextFormField(
        validator: (value) {
          if (value == null) {
            return 'this field is required';
          } else {
            return null;
          }
        },
        maxLines: null,
        expands: true,
        keyboardType: type,
        obscureText: choose!,
        decoration: InputDecoration(
          filled: true,
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kMainColor),
          ),
        ),
      ),
    );
  }
}
