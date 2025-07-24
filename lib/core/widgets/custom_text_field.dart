import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/presentation/views/widgets/constans.dart';

class CTextField extends StatelessWidget {
  CTextField({
    required this.choose,
    super.key,
    this.hint,
    this.type,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator = null,
  });
  final int? minLines;
  final int? maxLines;
  final String? hint;
  final bool? choose;
  final TextInputType? type;
  String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  @override
  Widget build(final BuildContext context) => TextFormField(
    onChanged: onChanged,
    validator: (final value) {
      if (value == null || value.isEmpty) {
        return 'this field is required';
      } else {
        validator;
      }
    },
    autovalidateMode: AutovalidateMode.disabled,
    keyboardType: type,
    maxLines: maxLines,
    minLines: minLines,
    obscureText: choose!,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: const Color.fromARGB(255, 113, 114, 121),
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
