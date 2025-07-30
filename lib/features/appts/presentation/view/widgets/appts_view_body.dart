import 'package:flutter/material.dart';
import '../../../../../core/entities/appointment_entity.dart';
import 'appointment_card.dart';

class ApptsViewBody extends StatelessWidget {
  const ApptsViewBody({required this.appointments, super.key});

  final List<AppointmentEntity> appointments;

  @override
  Widget build(final BuildContext context) => Column(
    children: appointments
        .map((final appointment) => AppointmentCard(appointment: appointment))
        .toList(),
  );
}
