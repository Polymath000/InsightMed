import 'package:flutter/material.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/themes/app_colors.dart';

class AleardyHaveAnAccount extends StatelessWidget {
  const AleardyHaveAnAccount({super.key});

  @override
  Widget build(final BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Aleardy have an account? ', style: TextStyle(fontSize: 16)),
      GestureDetector(
        onTap: () {
          AppRoutes.pop(context);
        },
        child: Text(
          'Sign in',
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
