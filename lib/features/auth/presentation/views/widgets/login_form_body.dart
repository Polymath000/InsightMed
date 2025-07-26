import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'constans.dart';

class LoginFormBody extends StatefulWidget {
  const LoginFormBody({super.key});

  @override
  State<LoginFormBody> createState() => _LoginFormBodyState();
}

class _LoginFormBodyState extends State<LoginFormBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
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
        CTextField(
          hint: 'Enter your email',
          choose: false,
          type: TextInputType.emailAddress,
          onChanged: (final p0) {
            email = p0;
          },
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
        CTextField(
          hint: 'Enter your password',
          choose: true,
          onChanged: (final p0) {
            password = p0;
          },
        ),
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
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              if (kDebugMode) {
                print('Email: $email, Password: $password');
              }
              await BlocProvider.of<AuthCubit>(
                context,
              ).login(email: email!, password: password!);
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Login pressed')));
              }
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },
          btnText: 'Login with Email',
          colorText: kBasicColor,
        ),
      ],
    ),
  );
}
