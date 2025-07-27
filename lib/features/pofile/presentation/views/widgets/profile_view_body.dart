import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/widgets/custbutton.dart';
import 'contact_info_container.dart';
import 'personal_info.dart';
import 'security_container.dart';
import 'show_dialog_for_edit_patient_profile.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  UserEntity _user = getUser ?? const UserEntity();
  bool isLoading = false;
  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,
    child: CustomScrollView(
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
              child: PersonalContainer(
                onChanged: (final value) {
                  _user = _user.copyWith(name: value!.name);
                  _user = _user.copyWith(age: value.age);
                  _user = _user.copyWith(gender: value.gender);
                },
              ),
            ),
            const Divider(),
            const ListTile(
              title: IText('Contact Information', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ContactInfoContainer(
                onChanged: (final value) {
                  _user = _user.copyWith(phoneNumber: value!.phoneNumber);
                  _user = _user.copyWith(email: value.email);
                },
              ),
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
                  await showDialogForEditPatientProfile(
                    context,
                    user: _user,
                    onChanged: (p0) {
                      isLoading  = p0!;
                    },
                  );
                },
                btnText: 'Save Change',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
