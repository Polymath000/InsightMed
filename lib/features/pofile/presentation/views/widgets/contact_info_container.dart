import 'package:flutter/material.dart';

import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/widgets/app_text_field.dart';

class ContactInfoContainer extends StatelessWidget {
  const ContactInfoContainer({super.key});
  @override
  Widget build(final BuildContext context) {
    final user = getUser;
    return Column(
      children: [
        AppTextField(
          labelText: 'Phone Number',
          hintText: 'Enter your phone number',
          prefixIcon: const Icon(Icons.phone_outlined),
          keyboardType: TextInputType.number,
          intialVlue: user?.phoneNumber,
        ),
        AppTextField(
          labelText: 'Email Address',
          hintText: 'Enter your email',
          prefixIcon: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          intialVlue: user?.email,
        ),
      ],
    );
  }
}
