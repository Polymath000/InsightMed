import 'package:flutter/material.dart';

import '../../../../../core/utls/i_text.dart';
import 'contact_info_container.dart';
import 'personal_info.dart';
import 'security_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 16,
        children: [
          const Card.filled(
            child: Column(
              children: [
                ListTile(
                  title: IText(
                    'Personal Information',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                PersonalContainer(),
              ],
            ),
          ),
          const Card.filled(
            child: Column(
              children: [
                ListTile(
                  title: IText(
                    'Contact Information',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ContactInfoContainer(),
              ],
            ),
          ),
          const Card.filled(
            child: Column(
              children: [
                ListTile(
                  title: IText('Security', style: TextStyle(fontSize: 20)),
                ),
                SecurityContainer(),
              ],
            ),
          ),
          FilledButton(child: const IText('Save Change'), onPressed: () {}),
        ],
      ),
    ),
  );
}
