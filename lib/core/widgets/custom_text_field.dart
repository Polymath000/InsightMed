import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    required this.choose,
    super.key,
    this.hint,
    this.type,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
  });
  final int? minLines;
  final int? maxLines;
  final String? hint;
  final bool? choose;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  @override
  Widget build(final BuildContext context) => TextFormField(
    onChanged: onChanged,
    validator: (final value) {
      if (value == null || value.isEmpty) {
        return 'this field is required';
      } else if (validator != null) {
        return validator!(value);
      }
      return null;
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
    ),
  );
}
