import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../appointments/cubit/book_appointment/book_appointment_cubit.dart';

class ApptsView extends StatefulWidget {
  const ApptsView({super.key});

  @override
  State<ApptsView> createState() => _ApptsViewState();
}

class _ApptsViewState extends State<ApptsView> {
  Future<String>? _appointmentFuture;

  @override
  void initState() {
    super.initState();
    _appointmentFuture =
        context.read<BookAppointmentCubit>().getPatientAppiontment();
  }

  @override
  Widget build(final BuildContext context) => FutureBuilder<String>(
        future: _appointmentFuture,
        builder: (final context, final snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No appointment found.'));
          } else {
            final appointmentTime = snapshot.data!;
            try {
              final parsedTime = DateTime.parse(appointmentTime);
              final month = DateFormat.MMM().format(parsedTime);
              final day = DateFormat.d().format(parsedTime).padLeft(2, '0');
              final startTime = DateFormat.jm().format(parsedTime);
              final endTime = DateFormat.jm()
                  .format(parsedTime.add(const Duration(minutes: 45)));

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
            } catch (e) {
              return Center(
                child: Text('Could not parse appointment time: $appointmentTime'),
              );
            }
          }
        },
      );
}