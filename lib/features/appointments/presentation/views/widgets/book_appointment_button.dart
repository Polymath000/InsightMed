import 'package:flutter/material.dart'
    show EdgeInsets, Padding, SliverToBoxAdapter, StatelessWidget;
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custbutton.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';

final class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key});

  @override
  SliverToBoxAdapter build(_) => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: BlocProvider(
        create: (context) => BookAppointmentCubit(),
        child: Builder(
          builder: (final context) => CustomButton(onTap: () {
            BlocProvider.of<BookAppointmentCubit>(context).getAppiontments();
          }, btnText: 'Book Appointment'),
        ),
      ),
    ),
  );
}
