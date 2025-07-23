import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/aleardy_have_an_account.dart';
import 'widgets/animated_text_sign_up.dart';
import 'widgets/container.dart';
import 'widgets/or.dart';
import 'widgets/signup_form.dart';
import 'widgets/social_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Create Account',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
      ),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 45),
          Text(
            'Welcome Back!',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 85),
          const AnimatedTextSignUp(),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          const SignupForm(),

          SizedBox(height: MediaQuery.of(context).size.height / 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Ccontainer(), OR(), Ccontainer()],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),

          const SocialAuth(),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          const AleardyHaveAnAccount(),
        ],
      ),
    ),
  );
}
