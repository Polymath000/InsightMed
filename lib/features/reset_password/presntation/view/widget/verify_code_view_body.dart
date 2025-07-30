import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'custom_animated_text_kit.dart';

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({
    required this.email,
    required this.onCodeChanged,
    super.key,
  });
  final String email;
  final ValueChanged<String>? onCodeChanged;

  @override
  State<VerifyCodeViewBody> createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  String code = '';

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
          const CustomAnimatedTextKit(title: 'Check your mail'),
          const SizedBox(height: 16),
          Text(
            'We have sent a password recover '
            ' instructions to your email.',
            style: AppTextStyles.bodyLarge,
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Text(
                'Enter The Verified Code',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 7),
          CustomTextField(
            hint: 'code',
            choose: false,
            type: TextInputType.number,
            onChanged: (final p0) {
              code = p0!;
              widget.onCodeChanged!(p0);
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await context.read<ResetPasswordCubit>().checkVerifiedCode(
                  code: code,
                  email: widget.email,
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
            btnText: 'Verify Code',
          ),
        ],
      ),
    ),
  );
}
