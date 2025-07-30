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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Create Account'), centerTitle: true),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.list(
              children: [
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const AnimatedTextSignUp(),
                const SizedBox(height: 12),
                SignupForm(
                  onLoadingChanged: ({final isLoading = false}) =>
                      setState(() => isLoad = isLoading),
                ),
                const SizedBox(height: 12),
                const AleardyHaveAnAccount(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
