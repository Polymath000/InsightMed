import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'custom_animated_text_kit.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({required this.onEmailChanged, super.key});
  final void Function(String) onEmailChanged;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String email = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) => CustomScrollView(
    slivers: [
      SliverAppBar.large(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CustomAnimatedTextKit(title: 'Reset Password'),
      ),
      Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.list(
            children: [
              const Text(
                'Enter the email associated with your account '
                " and we'll send an email with instructions to "
                'reset your password.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              AppTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                validator: (final value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onChanged: (final p0) {
                  email = p0;
                  widget.onEmailChanged(email);
                },
              ),
              CustomButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await context.read<ResetPasswordCubit>().sendVerifiedCode(
                      email: email,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                btnText: 'Send Instructions',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
