// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/custbutton.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, this.onLoadingChanged});
  final void Function(bool)? onLoadingChanged;
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  UserEntity user = const UserEntity(
    age: '',
    gender: '',
    phoneNumber: '',
    name: '',
    email: '',
    passwordConfirmation: '',
    role: '',
  );

  String? confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) => Form(
    key: _formKey,
    autovalidateMode: autovalidateMode,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: (final value) {
            if (value?.isNotEmpty ?? false) {
              return null;
            } else {
              return 'Email is required';
            }
          },
          onChanged: (final p0) =>
              setState(() => user = user.copyWith(email: p0)),
        ),
        const Text(
          'Password',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hintText: 'Password',
          obscureText: true,
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
        ),
        const Text(
          'Confirm Password',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hintText: 'Confirm Password',
          obscureText: true,
          validator: (final value) {
            if (value == null || value.isEmpty) {
              return 'Confirm Password is required';
            } else {
              return null;
            }
          },
          onChanged: (final p0) {
            setState(() {
              confirmPassword = p0;
              user = user.copyWith(passwordConfirmation: p0);
            });
          },
        ),
        const SizedBox(height: 16),
        CustomButton(
          onTap: () async {
            setState(() {
              isLoading = true;
              widget.onLoadingChanged!(isLoading);
            });
            if (_formKey.currentState!.validate() &&
                user.password == confirmPassword) {
              _formKey.currentState!.save();
              setState(() {
                isLoading = false;
                widget.onLoadingChanged!(isLoading);
              });
              await AppRoutes.patientInformation(context, user: user);
            } else if (user.password != confirmPassword) {
              setState(() {
                isLoading = false;
                widget.onLoadingChanged!(isLoading);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Passwords do not match')),
              );
            } else {
              setState(() {
                isLoading = false;
                widget.onLoadingChanged!(isLoading);
              });
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },
          btnText: 'Create Account',
        ),
      ],
    ),
  );
}
