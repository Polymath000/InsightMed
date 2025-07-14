import 'package:flutter/material.dart';
import 'widgets/donnot_have_an_account.dart';
import 'widgets/container.dart';
import 'widgets/login_form.dart';
import 'widgets/or.dart';
import 'widgets/social_auth.dart';
import 'widgets/top_login_view.dart';

class LoginScreen extends StatelessWidget {  
  static const String routeName = 'loginview';
  @override
  Widget build(final BuildContext context) => Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 22, 14, 15),
        child: ListView(
          children: [
            const TopLoginView(),
            SizedBox(height: MediaQuery.of(context).size.height / 37),
            const LoginForm(),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Ccontainer(), OR(), Ccontainer()],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            const SocialAuth(),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
             DonnotHaveAnAccount(),
          ],
        ),
      ),
    );
}
