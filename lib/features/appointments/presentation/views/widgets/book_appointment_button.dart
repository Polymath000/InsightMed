import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';

import '../../../../../core/widgets/custbutton.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';

class BookAppointmentButton extends StatefulWidget {
  const BookAppointmentButton({
    required this.selectedTime,
    super.key,
    this.onBook,
  });
  final String selectedTime;
  final ValueChanged<bool>? onBook;

  @override
  State<BookAppointmentButton> createState() => _BookAppointmentButtonState();
}

class _BookAppointmentButtonState extends State<BookAppointmentButton> {
  bool isBooked = SharedPreferencesSingleton.getBool(isBookedKey) ?? false;
  @override
  Widget build(final BuildContext context) {
    final appointmentId = SharedPreferencesSingleton.getString(
      appointmentIdKey,
    );
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (final context) => BookAppointmentCubit(),
        child: Builder(
          builder: (final context) =>
              BlocListener<BookAppointmentCubit, BookAppointmentState>(
                listener: (final context, final state) {
                  if (state is BookAppointmentSuccess) {
                    setState(() {
                      isBooked = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Appointment booked successfully!'),
                      ),
                    );
                    widget.onBook?.call(false);
                  } else if (state is DeleteAppointmentSuccess) {
                    setState(() {
                      isBooked = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Appointment cancelled!')),
                    );
                    widget.onBook?.call(false);
                  } else if (state is BookAppointmentFailure) {
                    setState(() {
                      isBooked = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Failed to book appointment: ${state.message}',
                        ),
                      ),
                    );
                    widget.onBook?.call(false);
                  } else if (state is BookAppointmentLoading) {
                    widget.onBook?.call(true);
                  }
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomButton(
                        onTap: () async {
                          if (widget.selectedTime.isEmpty && !isBooked) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please choose a slot'),
                              ),
                            );
                            return;
                          }
                          if (isBooked) {
                            await BlocProvider.of<BookAppointmentCubit>(
                              context,
                            ).deleteAppointment(id: appointmentId ?? '');
                          } else {
                            await BlocProvider.of<BookAppointmentCubit>(
                              context,
                            ).bookAppointment(appointment: widget.selectedTime);
                          }
                        },
                        btnText: isBooked
                            ? 'Change Appointment'
                            : 'Book Appointment',
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
