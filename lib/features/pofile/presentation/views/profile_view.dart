import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/user_entity.dart';
import '../../cubit/profile_of_patient_/profile_of_patient_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
    body: BlocProvider(
      create: (context) => ProfileOfPatientCubit()..getPatientDetails(),
      child: BlocConsumer<ProfileOfPatientCubit, ProfileOfPatientState>(
        listenWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        listener: (context, state) {
          if (state is ProfileOfPatientFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('There was an error , please try again later'),
                ),
              );
            });
          }
        },
        builder: (context, state) {
          if (state is ProfileOfPatientLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileOfPatientFailure) {
            return const Center(
              child: Center(
                child: Text('Failed to load profile. Please try again later.'),
              ),
            );
          } else if (state is ProfileOfPatientSuccess) {
            UserEntity user = state.user;
            return ProfileViewBody(user: user);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  );
}
