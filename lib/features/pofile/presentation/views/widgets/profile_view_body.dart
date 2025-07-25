import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../cubit/profile_of_patient_/profile_of_patient_cubit.dart';
import 'contact_info_container.dart';
import 'personal_info.dart';
import 'security_container.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({super.key, required this.user});

  final UserEntity user;
  @override
  Widget build(final BuildContext context) => CustomScrollView(
    slivers: [
      const SliverAppBar(title: IText('My Profile'), centerTitle: true),
      SliverList.list(
        children: [
          const ListTile(
            title: IText(
              'Personal Information',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PersonalContainer(user: user),
          ),
          const Divider(),
          const ListTile(
            title: IText('Contact Information', style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ContactInfoContainer(user: user),
          ),
          const Divider(),
          const ListTile(
            title: IText('Security', style: TextStyle(fontSize: 20)),
          ),
          const SecurityContainer(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CButton(
              onTap: () async {
                // log();
              },
              btnText: 'Save Change',
            ),
          ),
        ],
      ),
    ],
  );
}
