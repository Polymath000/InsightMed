import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/profile_of_patient_/profile_of_patient_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
    body: BlocProvider(
      create: (final context) => ProfileOfPatientCubit()..getPatientDetails(),
      child: BlocConsumer<ProfileOfPatientCubit, ProfileOfPatientState>(
        listenWhen: (final previous, final current) =>
            previous.runtimeType != current.runtimeType,
        listener: (final context, final state) {
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
        builder: (final context, final state) {
          if (state is ProfileOfPatientLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileOfPatientFailure) {
            return const Center(
              child: Center(
                child: Text('Failed to load profile. Please try again later.'),
              ),
            );
          } else if (state is ProfileOfPatientSuccess) {
            var user = state.user;
            return ProfileViewBody(user: user);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  );
}
