import 'package:flutter/material.dart'
    show CalendarDatePicker, SliverToBoxAdapter, StatelessWidget;

final class AppointmentsDatePicker extends StatelessWidget {
   AppointmentsDatePicker({
    super.key,
    required this.onDateChanged,
  });
  final void Function(DateTime) onDateChanged;
  final DateTime initialDate = DateTime.now();

  @override
  SliverToBoxAdapter build(_) => SliverToBoxAdapter(
        child: CalendarDatePicker(
          initialDate: initialDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateChanged: onDateChanged,
          selectableDayPredicate: (final day) {
            if (day.weekday == 5 || day.weekday == 6) {
              return false;
            }
            return true;
          },
        ),
      );
}