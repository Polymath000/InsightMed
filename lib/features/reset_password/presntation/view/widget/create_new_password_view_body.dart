import 'package:flutter/material.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'custom_animated_text_kit.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  CreateNewPasswordViewBody({super.key, required this.email});
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  final String email;
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
              onChanged: (final p0) {},
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
              onChanged: (final p0) {},
            ),
            const SizedBox(height: 30),
            CustomButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
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