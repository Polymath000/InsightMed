import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_media_query.dart';
import '../../../../../core/utls/i_text.dart';

class AppointmentsViewBody extends StatelessWidget {
  const AppointmentsViewBody({super.key});

  @override
  Widget build(final BuildContext context) => CustomScrollView(
    slivers: [
      const SliverAppBar(title: Text('Appointments')),
      SliverToBoxAdapter(
        child: CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateChanged: (_) {},
        ),
      ),
      const SliverToBoxAdapter(
        child: ListTile(title: IText('Available Slots - July 11')),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: Wrap(
            spacing: 8,
            children: List.generate(15, (final index) {
              final time = TimeOfDay(
                hour: (index / 2 + 9).toInt() % 24,
                minute: index.isEven ? 0 : 30,
              ).format(context);
              return SizedBox(
                width: (AppMediaQuery.width - 48) / 3,
                child: ChoiceChip(
                  label: SizedBox.fromSize(
                    size: const Size.fromHeight(22),
                    child: IText(time, textAlign: TextAlign.center),
                  ),
                  selected: false,
                  onSelected: (_) {},
                ),
              );
            }),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: () {},
            child: const IText('Book Appointment'),
          ),
        ),
      ),
    ],
  );
}
