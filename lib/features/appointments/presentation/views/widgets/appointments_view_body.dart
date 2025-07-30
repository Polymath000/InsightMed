import 'package:flutter/material.dart'
    show CustomScrollView, ListTile, SliverAppBar, SliverToBoxAdapter;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/i_text.dart' show IText;
import '../../../cubit/book_appointment/book_appointment_cubit.dart';
import 'appointments_date_picker.dart';
import 'appointments_time_picker.dart' show AppointmentsTimePicker;
import 'book_appointment_button.dart' show BookAppointmentButton;

final class AppointmentsViewBody extends StatefulWidget {
  const AppointmentsViewBody({super.key});

  @override
  State<AppointmentsViewBody> createState() => _AppointmentsViewBodyState();
}

class _AppointmentsViewBodyState extends State<AppointmentsViewBody> {
  String selectedAppointmentTime = '';
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(final BuildContext context) => BlocProvider(
    create: (final context) => BookAppointmentCubit(),
    child: Builder(
      builder: (final context) {
        context.read<BookAppointmentCubit>().getAppiontments(
          date: selectedDate.toString().substring(0, 10),
        );
        return CustomScrollView(
          slivers: [
            const SliverAppBar(title: IText('Appointments')),
            AppointmentsDatePicker(
              onDateChanged: (final date) {
                setState(() {
                  selectedDate = date;
                  isLoading = false;
                });
                context.read<BookAppointmentCubit>().getAppiontments(
                  date: date.toString().substring(0, 10),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: ListTile(title: IText('Available Slots')),
            ),
            AppointmentsTimePicker(
              onTimeSelected: (final selectedTime) {
                setState(() {
                  selectedAppointmentTime = selectedTime;
                });
              },
              selectedDateTime: selectedDate,
              onSelectDate: (final value) {
                isLoading = value;
              },
            ),
            BookAppointmentButton(
              selectedTime: selectedAppointmentTime,
              onBook: (final value) {
                setState(() {
                  isLoading = value;
                });
              },
            ),
          ],
        );
      },
    ),
  );
}
