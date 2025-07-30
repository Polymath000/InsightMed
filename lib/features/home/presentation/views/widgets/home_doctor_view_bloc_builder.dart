import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/get_patients_cubit/get_patients_cubit.dart';
import 'home_doctor_view_body.dart';
import 'home_doctor_view_body_skeletonizer.dart';

class HomeDoctorViewBlocBuilder extends StatelessWidget {
  const HomeDoctorViewBlocBuilder({super.key});

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<GetPatientsCubit, GetPatientsState>(
        builder: (final context, final state) {
          if (state is GetPatientsSuccess) {
            return HomeDoctorViewBody(patients: state.patients);
          }
          if (state is GetPatientsFailure) {
            return Center(child: Text(state.message));
          }
          if (state is GetPatientsLoading) {
            return const HomeDoctorViewBodySkeletonizer();
          }
          return const Center(child: Text('Something went wrong'));
        },
      );
}
