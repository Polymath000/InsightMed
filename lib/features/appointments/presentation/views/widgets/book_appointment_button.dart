import 'package:flutter/material.dart'
    show EdgeInsets, FilledButton, Padding, SliverToBoxAdapter, StatelessWidget;

import '../../../../../core/widgets/custbutton.dart';

final class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key});

  @override
  SliverToBoxAdapter build(_) => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: CButton(onTap: () {}, btnText: 'Book Appointment'),
    ),
  );
}
