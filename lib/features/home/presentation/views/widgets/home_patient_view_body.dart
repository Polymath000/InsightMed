import 'package:flutter/material.dart'
    show CircularProgressIndicator, CustomScrollView, StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/dashboard_entity.dart';
import '../../controllers/user_dashboard_cubit/user_dashboard_cubit.dart';
import 'home_app_bar.dart' show HomeAppBar;
import 'sticker_appointment.dart';
import 'sticker_note.dart';
import 'sticker_ray.dart';

final class HomePatientViewBlocBuilder extends StatelessWidget {
  const HomePatientViewBlocBuilder({super.key});

  @override
  BlocBuilder build(final BuildContext context) =>
      BlocBuilder<UserDashboardCubit, UserDashboardState>(
        builder: (final context, final state) {
          if (state is UserDashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserDashboardSuccess) {
            return HomePatientViewBody(dashboard: state.dashboard);
          }
          return const Center(child: Text('Something went wrong'));
        },
      );
}

class HomePatientViewBody extends StatelessWidget {
  const HomePatientViewBody({required this.dashboard, super.key});
  final DashboardEntity dashboard;
  @override
  Widget build(final BuildContext context) => CustomScrollView(
    slivers: [
      const HomeAppBar(),
      StickerNote(notes: dashboard.notes),
      StickerRay(rays: dashboard.rays),
      if (dashboard.appointment?.isValid ?? false)
        StickerAppointment(appointment: dashboard.appointment!),
    ],
  );
}
