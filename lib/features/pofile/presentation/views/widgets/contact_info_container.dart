import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/widgets/app_text_field.dart';

class ContactInfoContainer extends StatelessWidget {
  const ContactInfoContainer({super.key, this.onChanged});
  final void Function(UserEntity?)? onChanged;

  @override
  Widget build(final BuildContext context) {
    UserEntity user = getUser ?? const UserEntity();
    return Column(
      children: [
        AppTextField(
          labelText: 'Phone Number',
          hintText: 'Enter your phone number',
          prefixIcon: const Icon(Icons.phone_outlined),
          keyboardType: TextInputType.number,
          intialVlue: user.phoneNumber,
          onChanged: (value) {
            user = user.copyWith(phoneNumber: value);
            onChanged!(user);
          },
        ),
        AppTextField(
          labelText: 'Email Address',
          hintText: 'Enter your email',
          prefixIcon: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          intialVlue: user.email,
          onChanged: (value) {
            user = user.copyWith(email: value);
            onChanged!(user);
          },
        ),
      ],
    );
  }
}
