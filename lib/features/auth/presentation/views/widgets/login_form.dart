import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constans.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(final BuildContext context) => Form(
    key: _formKey,
    autovalidateMode: autovalidateMode,
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'Email',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 87),
        const CTextField(
          hint: 'Enter your email',
          choose: false,
          type: TextInputType.emailAddress,
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 89),
        Row(
          children: [
            Text(
              'Password',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 87),
        const CTextField(hint: 'Enter your password', choose: true),
        SizedBox(height: MediaQuery.of(context).size.height / 50),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forget Password?',
              style: TextStyle(
                color: kMainColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        CButton(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login pressed')));
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },
          colorbackground: kMainColor,
          btnText: 'Login with Email',
          colorText: kBasicColor,
        ),
      ],
    ),
  );
}
