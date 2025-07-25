import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_field.dart' show AppTextField;
import '../../../../auth/presentation/views/widgets/radio_btn.dart';

class PersonalContainer extends StatelessWidget {
  const PersonalContainer({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      const AppTextField(
        labelText: 'Full Name',
        hintText: 'Enter your full name',
        prefixIcon: Icon(Icons.person_2_outlined),
      ),
      const AppTextField(
        labelText: 'Age',
        hintText: 'Enter your age',
        prefixIcon: Icon(Icons.calendar_month_outlined),
        keyboardType: TextInputType.number,
      ),
      RadioBtn(onChanged: (_) {}),
    ],
  );
}
