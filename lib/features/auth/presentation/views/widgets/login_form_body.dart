import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../pofile/presentation/views/widgets/label_text.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText(labelText: 'Email'),
          CustomTextField(
            hint: 'Enter your email',
            choose: false,
            type: TextInputType.emailAddress,
            onChanged: (p0) {
              email = p0;
            },
          ),
          const SizedBox(height: 15),
          const LabelText(labelText: 'Password'),
          CustomTextField(
            hint: 'Enter your password',
            choose: true,
            onChanged: (p0) {
              password = p0;
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  await AppRoutes.resetPasswordView(context);
                },
                child: const Text(
                  'Forget Password?',
                  style: const TextStyle(
                    color: kMainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14, // avoid using .sp unless you’re using flutter_screenutil
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          CustomButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (kDebugMode) {
                  print('Email: $email, Password: $password');
                }
                await BlocProvider.of<AuthCubit>(
                  context,
                ).login(email: email!, password: password!);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            btnText: 'Login with Email',
          ),
        ],
      ),
    );
}
