import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../cubit/reset_password_cubit/reset_password_cubit.dart';
import 'custom_animated_text_kit.dart';

class VerifyCodeViewBody extends StatelessWidget {
  VerifyCodeViewBody({super.key, required this.email});
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  final String email;
  String code = '';
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            CustomAnimatedTextKit(title: 'Check your mail'),
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
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
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
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              onTap: () async {
                print(email);
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await context.read<ResetPasswordCubit>().checkVerifiedCode(code: code, email: email);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              btnText: 'Verify Code',
              colorText: AppColors.primary,
            ),
          ],
        ),
      ),
    );
}