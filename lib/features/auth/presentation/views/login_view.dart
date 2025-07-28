import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/container.dart';
import 'widgets/donnot_have_an_account.dart';
import 'widgets/login_form.dart';
import 'widgets/or.dart';
import 'widgets/social_auth.dart';
import 'widgets/top_login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'loginview';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,
    child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 22, 14, 15),
        child: ListView(
          children: [
            const TopLoginView(),
            SizedBox(height: MediaQuery.of(context).size.height / 37),
            LoginForm(
              onLoadingChanged: ({final isLoading = false}) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      this.isLoading = isLoading;
                    });
                  }
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
 
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            const DonnotHaveAnAccount(),
          ],
        ),
      ),
    ),
  );
}
