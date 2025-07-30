import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/entities/appointment_entity.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({required this.appointment, super.key});
  final AppointmentEntity appointment;

  @override
  Widget build(_) {
    final appointmentTime = appointment.appointmentTime!;
    final month = DateFormat.MMM().format(appointmentTime);
    final day = DateFormat.d().format(appointmentTime).padLeft(2, '0');
    final startTime = DateFormat.jm().format(appointmentTime);
    final endTime = DateFormat.jm().format(
      appointmentTime.add(const Duration(minutes: 45)),
    );
    return Card.filled(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        minTileHeight: 84,
        leading: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(month),
                Text(
                  day,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text('$startTime - $endTime'),
      ),
    );
  }
}
