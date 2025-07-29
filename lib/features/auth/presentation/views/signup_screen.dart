import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/aleardy_have_an_account.dart';
import 'widgets/animated_text_sign_up.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoad = false;
  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoad,
    child: Scaffold(
      appBar: AppBar(title: const Text('Create Account'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
        child: Column(
          spacing: 15,
          children: [
            const Row(
              children: [
                const Text(
                  'Welcome!',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const Row(children: [AnimatedTextSignUp()]),
            SignupForm(
              onLoadingChanged: (final isLoading) =>
                  setState(() => isLoad = isLoading),
            ),
            const AleardyHaveAnAccount(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    ),
  );
}
