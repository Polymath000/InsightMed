import 'package:flutter/material.dart'
    show CalendarDatePicker, SliverToBoxAdapter, StatelessWidget;

final class AppointmentsDatePicker extends StatelessWidget {
  const AppointmentsDatePicker({super.key});

  @override
  SliverToBoxAdapter build(_) => SliverToBoxAdapter(
    child: CalendarDatePicker(
      initialDate: DateTime.now().copyWith(
        day: switch (DateTime.now().weekday) {
          5 => DateTime.now().day + 2,
          6 => DateTime.now().day + 1,
          _ => DateTime.now().day,
        },
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      onDateChanged: (_) {},
      selectableDayPredicate: (final day) {
        if (day.weekday == 5 || day.weekday == 6) {
          return false;
        }
        return true;
      },
    ),
  );
}
