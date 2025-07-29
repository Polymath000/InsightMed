// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../pofile/presentation/views/widgets/label_text.dart';
import 'constans.dart';
import 'user_entities.dart';
import 'vaildated_confirm_password.dart';
import 'validated_password_formfield.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, this.onLoadingChanged});
  final void Function(bool)? onLoadingChanged;
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) => Form(
    key: _formKey,
    autovalidateMode: autovalidateMode,
    child: Column(
      spacing: 12,
      children: [
        const LabelText(labelText: 'Email'),
        CustomTextField(
          hint: 'Email',
          choose: false,
          type: TextInputType.emailAddress,
          onChanged: (final p0) {
            setState(() {
              user = user.copyWith(email: p0);
            });
          },
        ),
        const LabelText(labelText: 'Password'),
        const ValidatePasswordFormField(),
        const LabelText(labelText: 'Confirm Password'),
        const ConfirmPasswordValidate(),
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
          colorText: kBasicColor,
        ),
      ],
    ),
  );
}
