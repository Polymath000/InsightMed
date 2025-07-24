import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'My Profile',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
      ),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView(children: const [ProfileViewBody()]),
    ),
  );
}
