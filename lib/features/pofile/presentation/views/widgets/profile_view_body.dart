import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/user_entity.dart';
import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../cubit/profile_of_patient_/profile_of_patient_cubit.dart';
import 'contact_info_container.dart';
import 'personal_info.dart';
import 'security_container.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({super.key});
  UserEntity user = getUser ?? const UserEntity();
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
            child: PersonalContainer(
              onChanged: (value) {
                user = user.copyWith(name: value!.name);
                user = user.copyWith(age: value.age);
                user = user.copyWith(gender: value.gender);
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
              onChanged: (value) {
                user = user.copyWith(phoneNumber: value!.phoneNumber);
                user = user.copyWith(email: value.email);
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
                await showDialogForEditPatientProfile(context, user: user);
              },
              btnText: 'Save Change',
            ),
          ),
        ],
      ),
    ],
  );


}
  Future<dynamic> showDialogForEditPatientProfile(final BuildContext context, {required UserEntity user}) =>
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Are you sure?'),
          content: BlocProvider(
            create: (context) => ProfileOfPatientCubit(),
            child: Builder(
              builder: (context) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          label: const Text('Yes'),
                          onPressed: () {
                            BlocProvider.of<ProfileOfPatientCubit>(context).updatePatientDetails(user: user);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.blueAccent,
                            side: const BorderSide(color: Colors.blueAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            elevation: 0,
                          ),
                          icon: const Icon(Icons.close),
                          label: const Text('Cancel'),
                          onPressed: () {
                            AppRoutes.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );