import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'user_entities.dart';

class ConfirmPasswordValidate extends StatefulWidget {
  const ConfirmPasswordValidate({super.key});

  @override
  State<ConfirmPasswordValidate> createState() =>
      _ConfirmPasswordValidateState();
}

class _ConfirmPasswordValidateState extends State<ConfirmPasswordValidate> {
  @override
  Widget build(final BuildContext context) => CustomTextField(
    hint: 'Confirm Password',
    choose: true,
    onChanged: (final p0) {
      setState(() {
        confirmPassword = p0;
        user = user.copyWith(passwordConfirmation: p0);
      });
    },
  );
}