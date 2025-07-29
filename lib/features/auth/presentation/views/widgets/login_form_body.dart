import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../cubit/auth/auth_cubit.dart';

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
        const Text(
          'Email',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          validator: (final value) {
            if (value?.isNotEmpty ?? false) {
              return null;
            } else {
              return 'Email is required';
            }
          },
          onChanged: (final p0) => email = p0,
        ),
        const Text(
          'Password',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        AppTextField(
          hintText: 'Enter your password',
          obscureText: true,
          validator: (final value) {
            if (value?.isNotEmpty ?? false) {
              return null;
            } else {
              return 'Password is required';
            }
          },
          onChanged: (final p0) {
            password = p0;
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () async {
              await AppRoutes.resetPasswordView(context);
            },
            child: Text(
              'Forget Password?',
              style: TextStyle(
                color: AppColors.primaryContainer,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
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
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Welcom Back!')));
              }
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
