import 'package:flutter/material.dart';

import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(final BuildContext context) =>
       Scaffold(body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16),
        child: ProfileViewBody(),
      ));
}
