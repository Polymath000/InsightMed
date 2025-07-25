import 'package:flutter/material.dart';

class SecurityContainer extends StatelessWidget {
  const SecurityContainer({super.key});

  @override
  Widget build(final BuildContext context) => ListTile(
    leading: const Icon(Icons.lock_outlined),
    title: const Text('Change Password'),
    trailing: const Icon(Icons.arrow_right_outlined),
    onTap: () {},
  );
}
