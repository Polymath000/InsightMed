import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
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
  Widget build(final BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          CustomAnimatedTextKit(title: 'Reset Password'),
          const SizedBox(height: 16),
          Text(
            'Enter the email associated with your account '
            " and we'll send an email with instructions to "
            'reset your password.',
            style: AppTextStyles.bodyLarge,
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 7),
          CustomTextField(
            type: TextInputType.emailAddress,

            choose: false,
            hint: 'Email',
            onChanged: (final p0) {
              email = p0!;
              widget.onEmailChanged(email);
            },
          ),
          const SizedBox(height: 30),
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
            colorText: AppColors.primary,
          ),
        ],
      ),
    ),
  );
}
