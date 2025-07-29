import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/custom_show_snackBar.dart';
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
  Widget build(final BuildContext context) => SliverToBoxAdapter(
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
                  SharedPreferencesSingleton.setBool(isBookedKey, value: true);
                  customShowSnackBar(
                    context: context,
                    message: 'Appointment booked successfully!',
                  );
                  widget.onBook?.call(false);
                } else if (state is AppointmentAlreadyBooked) {
                  setState(() {
                    isBooked = true;
                  });
                  SharedPreferencesSingleton.setBool(isBookedKey, value: true);
                  customShowSnackBar(
                    context: context,
                    message: 'You already book appointment',
                  );
                  widget.onBook?.call(false);
                } else if (state is DeleteAppointmentSuccess) {
                  setState(() {
                    isBooked = false;
                  });
                  SharedPreferencesSingleton.setBool(isBookedKey, value: false);
                  customShowSnackBar(
                    context: context,
                    message: 'Appointment cancelled!',
                  );
                  widget.onBook?.call(false);
                } else if (state is BookAppointmentFailure) {
                  customShowSnackBar(
                    context: context,
                    message: 'Failed to book appointment',
                  );
                  widget.onBook?.call(false);
                } else if (state is BookAppointmentLoading) {
                  widget.onBook?.call(true);
                } else if (state is DeleteAppointmentFailure) {
                  widget.onBook?.call(false);
                  customShowSnackBar(
                    context: context,
                    message: 'Failed to delete appointment',
                  );
                  widget.onBook?.call(false);
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomButton(
                      onTap: () async {
                        if (widget.selectedTime.isEmpty && !isBooked) {
                          customShowSnackBar(
                            context: context,
                            message: 'Please choose a slot',
                          );
                          return;
                        }
                        if (isBooked) {
                          await BlocProvider.of<BookAppointmentCubit>(
                            context,
                          ).getPatientAppiontment();
                          await BlocProvider.of<BookAppointmentCubit>(
                            context,
                          ).deleteAppointment();
                        } else {
                          await BlocProvider.of<BookAppointmentCubit>(
                            context,
                          ).bookAppointment(appointment: widget.selectedTime);
                        }
                      },
                      btnText: isBooked
                          ? 'Cancel The Appointment'
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
