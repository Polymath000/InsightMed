import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_media_query.dart';
import '../../controllers/get_appiontment_cubit/get_appiontment_cubit.dart';
import 'appts_view_body.dart';
import 'appts_view_body_skeletonizer.dart';

class ApptsViewBlocBuilder extends StatelessWidget {
  const ApptsViewBlocBuilder({super.key});

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<GetAppiontmentCubit, GetAppiontmentState>(
        builder: (final context, final state) {
          if (state is GetAppiontmentLoading) {
            return const ApptsViewBodySkeletonizer();
          } else if (state is GetAppiontmentFailure) {
            return const Center(child: Text('No appointment found.'));
          } else if (state is GetAppointmentSuccess) {
            final appointments = state.appointments;
            if (appointments.isEmpty) {
              return SizedBox(
                height: AppMediaQuery.height / 2,
                child: const Center(
                  child: Text(
                    'No appointment found',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            }
            return ApptsViewBody(appointments: appointments);
          } else {
            return const Center(child: Text('No appointment found.'));
          }
        },
      );
}
