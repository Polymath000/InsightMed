import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../appointments/cubit/book_appointment/book_appointment_cubit.dart';

class ApptsView extends StatelessWidget {
  const ApptsView({required this.email, super.key});
  final String email;
  @override
  Widget build(
    final BuildContext context,
  ) => BlocProvider<BookAppointmentCubit>(
    create: (final context) =>
        BookAppointmentCubit()..getPatientAppiontment(email: email),
    child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (final context, final state) {
        if (state is BookAppointmentLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is BookAppointmentFailure) {
          return const Center(child: Text('No appointment found.'));
        } else if (state is GetAppointmentSuccess) {
          if (state.finalData.isEmpty) {
            return const Center(child: Text('No appointment found.'));
          }
          final appointmentTime = state.finalData.first;
          try {
            final parsedTime = DateTime.parse(appointmentTime);
            final month = DateFormat.MMM().format(parsedTime);
            final day = DateFormat.d().format(parsedTime).padLeft(2, '0');
            final startTime = DateFormat.jm().format(parsedTime);
            final endDateTime = parsedTime.add(const Duration(minutes: 30));
            final endTime = DateFormat.jm().format(endDateTime);
            return Card.filled(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                minTileHeight: 84,
                leading: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
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
          } on Exception {
            return Center(
              child: Text('Could not parse appointment time: $appointmentTime'),
            );
          }
        } else {
          return const Center(child: Text('No appointment found.'));
        }
      },
    ),
  );
}
