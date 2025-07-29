import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../appointments/cubit/book_appointment/book_appointment_cubit.dart';

class ApptsView extends StatelessWidget {
   ApptsView({super.key, required this.token});
  String token;
  @override
  Widget build(final BuildContext context) =>
      BlocProvider<BookAppointmentCubit>(
        create: (final context) =>
            BookAppointmentCubit()..getPatientAppiontment(token: token),
        child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
          builder: (final context, final state) {
            if (state is BookAppointmentLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is BookAppointmentFailure) {
              return Center(child: Text(state.message));
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
                final endTime = DateFormat.jm()
                    .format(parsedTime.add(const Duration(minutes: 45)));

                return Card.filled(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
              } catch (e) {
                return Center(
                  child: Text(
                    'Could not parse appointment time: $appointmentTime',
                  ),
                );
              }
            } else {
              return const Center(child: Text('No appointment found.'));
            }
          },
        ),
      );
}
