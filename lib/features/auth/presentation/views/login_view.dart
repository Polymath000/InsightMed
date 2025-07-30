import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/donnot_have_an_account.dart';
import 'widgets/login_form.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.list(
              children: [
                const TopLoginView(),
                const SizedBox(height: 12),
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
                const SizedBox(height: 12),
                const DonnotHaveAnAccount(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
