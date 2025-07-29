import 'package:flutter/material.dart';

import 'constans.dart';

class PatientTextOfTextField extends StatelessWidget {
  const PatientTextOfTextField({required this.text, super.key});
  final String? text;
  @override
  Widget build(final BuildContext context) =>
      Text(text!, style: const TextStyle(fontSize: 16, color: kSmain));
}
