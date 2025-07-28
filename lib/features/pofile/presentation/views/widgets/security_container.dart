import 'package:flutter/material.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/repos/auth_repo.dart';
import '../../../../../core/services/get_it_service.dart';

class SecurityContainer extends StatelessWidget {
  const SecurityContainer({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      ListTile(
        leading: const Icon(Icons.lock_outlined),
        title: const Text('Change Password'),
        trailing: const Icon(Icons.arrow_right_outlined),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.logout_outlined),
        title: const Text('LogOut'),
        trailing: const Icon(Icons.arrow_right_outlined),
        onTap: () => Future.wait([
          getIt<AuthRepository>().logout(),
          AppRoutes.login(context),
        ]),
      ),
    ],
  );
}
