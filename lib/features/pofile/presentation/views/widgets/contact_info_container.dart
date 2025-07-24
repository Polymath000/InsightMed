import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_field.dart';

class ContactInfoContainer extends StatelessWidget {
  const ContactInfoContainer({super.key});

  @override
  Widget build(final BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      children: [
        AppTextField(
          labelText: 'Phone Number',
          hintText: 'Enter your phone number',
          prefixIcon: Icon(Icons.phone_outlined),
          keyboardType: TextInputType.number,
        ),
        AppTextField(
          labelText: 'Email Address',
          hintText: 'Enter your email',
          prefixIcon: Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    ),
  );
}
