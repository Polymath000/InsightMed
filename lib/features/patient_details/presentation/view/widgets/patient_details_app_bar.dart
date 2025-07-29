import 'package:flutter/material.dart';

class PatientDetailsAppBar extends StatelessWidget {
  const PatientDetailsAppBar({super.key});

  @override
  Widget build(final BuildContext context) =>
      const SliverAppBar(title: Text('Patient Details'));
}
