import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../rays/cubit/get_rays/get_rays_cubit.dart';
import '../../../../rays/presentation/view/widget/ray_card.dart';

class RayResultsPatientDashboard extends StatelessWidget {
  const RayResultsPatientDashboard({super.key});
  static const String routeName = 'rayResultsPatientDashboard';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Rays')),
    body: BlocProvider(
      create: (final context) => GetRaysCubit()..getRays(),
      child: BlocConsumer<GetRaysCubit, GetRaysState>(
        listener: (final context, final state) {
          if (state is GetRaysFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('There was an error , please try again later'),
              ),
            );
          }
        },
        builder: (final context, final state) {
          if (state is GetRaysLoadding) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetRaysSuccess) {
            return ListView.builder(
              itemCount: state.rays.length,
              itemBuilder: (final context, final index) =>
                  RayCard(ray: state.rays[index], index: index + 1),
            );
          }
          return const Center(child: Text('No rays found'));
        },
      ),
    ),
  );
}
