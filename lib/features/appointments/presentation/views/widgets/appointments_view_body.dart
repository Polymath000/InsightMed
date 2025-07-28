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
import 'appointments_date_picker.dart'
    show AppointmentsDatePicker, selectedDate;
import 'appointments_time_picker.dart' show AppointmentsTimePicker;
import 'book_appointment_button.dart' show BookAppointmentButton;

final class AppointmentsViewBody extends StatefulWidget {
  AppointmentsViewBody({super.key});

  @override
  State<AppointmentsViewBody> createState() => _AppointmentsViewBodyState();
}

class _AppointmentsViewBodyState extends State<AppointmentsViewBody> {
  String selectedAppointmentTime = '';
  bool isBook = false;
  @override
  Widget build(_) => ModalProgressHUD(
    inAsyncCall: isBook,
    child: CustomScrollView(
      slivers: [
        const SliverAppBar(title: IText('Appointments')),
        const AppointmentsDatePicker(),
        const SliverToBoxAdapter(
          child: ListTile(title: IText('Available Slots')),
        ),
        AppointmentsTimePicker(
          onTimeSelected: (selectedTime) {
            setState(() {
              selectedAppointmentTime = selectedTime;
            });
          },
        ),
        BookAppointmentButton(selectedTime: selectedAppointmentTime, onBook:(value) {
          setState(() {
            isBook = value;
          });
        } ,),
      ],
    ),
  );
}
