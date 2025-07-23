import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'constans.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (context) => AuthCubit(),
    child: Builder(
      builder: (context) {
        return Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 87),
              CTextField(
                hint: 'Enter your email',
                choose: false,
                type: TextInputType.emailAddress,
                onChanged: (p0) {
                  email = p0;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 89),
              Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 87),
              CTextField(
                hint: 'Enter your password',
                choose: true,
                onChanged: (p0) {
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
                    await BlocProvider.of<AuthCubit>(context).login(
                      credintials: {'email': email, 'password': password},
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login pressed')),
                    );
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
      },
    ),
  );
}
