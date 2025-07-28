import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'custom_animated_text_kit.dart';

class CreateNewPasswordViewBody extends StatefulWidget {
  const CreateNewPasswordViewBody({
    required this.email,
    required this.onPasswordChanged,
    required this.code,
    super.key,
  });
  final String email;
  final ValueChanged<String>? onPasswordChanged;
  final String code;

  @override
  State<CreateNewPasswordViewBody> createState() =>
      _CreateNewPasswordViewBodyState();
}

class _CreateNewPasswordViewBodyState extends State<CreateNewPasswordViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  String password = '';

  String confirmPassword = '';

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          CustomAnimatedTextKit(title: 'Create new password'),
          const SizedBox(height: 16),
          Text(
            'Your new password must be different '
            'from previous used passwords.',
            style: AppTextStyles.bodyLarge,
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 7),
          CustomTextField(
            hint: 'Password',
            choose: true,
            onChanged: (final p0) {
              password = p0!;
              widget.onPasswordChanged!(p0);
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
          const SizedBox(height: 15),
          const Row(
            children: [
              Text(
                'Confirm Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 7),
          CustomTextField(
            hint: 'Confirm Password',
            choose: true,
            onChanged: (final p0) {
              confirmPassword = p0!;
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            onTap: () async {
              if (_formKey.currentState!.validate() &&
                  password == confirmPassword) {
                _formKey.currentState!.save();
                await context.read<ResetPasswordCubit>().createNewPassword(
                  code: widget.code,
                  email: widget.email,
                  password: password,
                  passwordConfirmation: confirmPassword,
                );
              } else if (password == confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The passwords not match'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
            btnText: 'Change New Password',
            colorText: AppColors.primary,
          ),
        ],
      ),
    ),
  );
}
