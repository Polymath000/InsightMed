import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'user_entities.dart';

class ValidatePasswordFormField extends StatefulWidget {
  const ValidatePasswordFormField({super.key});

  @override
  State<ValidatePasswordFormField> createState() =>
      _ValidatePasswordFormFieldState();
}

class _ValidatePasswordFormFieldState extends State<ValidatePasswordFormField> {
  @override
  Widget build(final BuildContext context) => CustomTextField(
    hint: 'Password',
    choose: true,
    onChanged: (final p0) {
      setState(() {
        user = user.copyWith(password: p0);
      });
    },
    validator: (final value) {
      final isValid =
          value != null &&
          value.length >= 6 &&
          RegExp('[A-Z]').hasMatch(value) &&
          RegExp('[a-z]').hasMatch(value) &&
          RegExp('[0-9]').hasMatch(value) &&
          RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

      return isValid
          ? null
          : 'Password must be 6+ chars and include '
                'uppercase, lowercase, number, and special character';
    },
  );
}
