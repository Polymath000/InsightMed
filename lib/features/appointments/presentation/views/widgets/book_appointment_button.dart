import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custbutton.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';

class BookAppointmentButton extends StatefulWidget {
  const BookAppointmentButton({
    super.key,
    required this.selectedTime,
    this.onBook,
  });
  final String selectedTime;
  final ValueChanged<bool>? onBook;

  @override
  State<BookAppointmentButton> createState() => _BookAppointmentButtonState();
}

class _BookAppointmentButtonState extends State<BookAppointmentButton> {
  bool isBooked = false;

  @override
  Widget build(final BuildContext context) => SliverToBoxAdapter(
    child: BlocProvider(
      create: (context) => BookAppointmentCubit(),
      child: Builder(
        builder: (context) =>
            BlocListener<BookAppointmentCubit, BookAppointmentState>(
              listener: (context, state) {
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
                          setState(() {
                            isBooked = false;
                          });
                          await BlocProvider.of<BookAppointmentCubit>(
                            context,
                            // TODO: retrive the id form SharedPreferences
                          ).deleteAppointment(id: 5);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Appointment cancelled!'),
                            ),
                          );
                        } else {
                          // Logic for booking appointment
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
