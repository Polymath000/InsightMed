import 'package:flutter/material.dart'
    show EdgeInsets, FilledButton, Padding, SliverToBoxAdapter, StatelessWidget;

import '../../../../../core/utls/i_text.dart' show IText;

final class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key});

  @override
  SliverToBoxAdapter build(_) => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FilledButton(
        onPressed: () {},
        child: const IText('Book Appointment'),
      ),
    ),
  );
}
