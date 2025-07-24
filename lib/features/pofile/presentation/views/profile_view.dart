import 'package:flutter/material.dart';

import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('My Profile')),
    body: const ProfileViewBody(),
  );
}
