import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/entities/appointment_entity.dart'
    show AppointmentEntity;
import 'appts_view_body.dart';

class ApptsViewBodySkeletonizer extends StatelessWidget {
  const ApptsViewBodySkeletonizer({super.key});

  @override
  Widget build(_) => Skeletonizer(
    child: ApptsViewBody(
      appointments: List.generate(
        10,
        (final index) => AppointmentEntity(appointmentTime: DateTime.now()),
      ),
    ),
  );
}
