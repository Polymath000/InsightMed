import 'package:flutter/material.dart'
    show
        CustomScrollView,
        ListTile,
        SliverAppBar,
        SliverToBoxAdapter,
        StatelessWidget;

import '../../../../../core/utls/i_text.dart' show IText;
import 'appointments_date_picker.dart' show AppointmentsDatePicker;
import 'appointments_time_picker.dart' show AppointmentsTimePicker;
import 'book_appointment_button.dart' show BookAppointmentButton;

final class AppointmentsViewBody extends StatelessWidget {
  const AppointmentsViewBody({super.key});

  @override
  CustomScrollView build(_) => const CustomScrollView(
    slivers: [
      SliverAppBar(title: IText('Appointments')),
      AppointmentsDatePicker(),
      SliverToBoxAdapter(
        child: ListTile(title: IText('Available Slots - July 11')),
      ),
      AppointmentsTimePicker(),
      BookAppointmentButton(),
    ],
  );
}
