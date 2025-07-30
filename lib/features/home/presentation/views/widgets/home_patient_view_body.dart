import 'package:flutter/widgets.dart';

import '../../../domain/entities/dashboard_entity.dart';
import 'home_app_bar.dart' show HomeAppBar;
import 'sticker_appointment.dart';
import 'sticker_note.dart';
import 'sticker_ray.dart';

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
