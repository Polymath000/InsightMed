import 'package:flutter/material.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/themes/app_colors.dart';

class DonnotHaveAnAccount extends StatelessWidget {
  const DonnotHaveAnAccount({super.key});

  @override
  Widget build(final BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have an account? ", style: TextStyle(fontSize: 16)),
      GestureDetector(
        onTap: () => AppRoutes.signUp(context),
        child: Text(
          'Sign up',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.primaryContainer,
          ),
        ),
      ),
    ],
  );
}
