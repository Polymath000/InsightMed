import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';

import 'package:flutter/material.dart'
    show
        CustomScrollView,
        ListTile,
        SliverAppBar,
        SliverToBoxAdapter,
        StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utls/i_text.dart' show IText;
import '../../../cubit/book_appointment/book_appointment_cubit.dart';
import 'appointments_date_picker.dart';
import 'appointments_time_picker.dart' show AppointmentsTimePicker;
import 'book_appointment_button.dart' show BookAppointmentButton;

final class AppointmentsViewBody extends StatefulWidget {
  AppointmentsViewBody({super.key});

  @override
  State<AppointmentsViewBody> createState() => _AppointmentsViewBodyState();
}

class _AppointmentsViewBodyState extends State<AppointmentsViewBody> {
  String selectedAppointmentTime = '';
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => BookAppointmentCubit(),
    child: Builder(
      builder: (context) {
        context.read<BookAppointmentCubit>().getAppiontments(
          date: selectedDate.toString().substring(0, 10),
        );

        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(title: IText('Appointments')),
              AppointmentsDatePicker(
                onDateChanged: (DateTime date) {
                  setState(() {
                    selectedDate = date;
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
                onTimeSelected: (selectedTime) {
                  setState(() {
                    selectedAppointmentTime = selectedTime;
                  });
                },
                selectedDateTime: selectedDate,
              ),
              BookAppointmentButton(
                selectedTime: selectedAppointmentTime,
                onBook: (value) {
                  setState(() {
                    isLoading = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
