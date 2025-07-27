import 'package:flutter/material.dart'
    show
        BuildContext,
        ChoiceChip,
        EdgeInsets,
        Size,
        SizedBox,
        SliverPadding,
        SliverToBoxAdapter,
        TextAlign,
        TimeOfDay,
        Wrap;
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/app_media_query.dart' show AppMediaQuery;
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';
import 'appointments_date_picker.dart';

class AppointmentsTimePicker extends StatefulWidget {
  final void Function(String selectedTime)? onTimeSelected; // optional callback

  const AppointmentsTimePicker({super.key, this.onTimeSelected});

  @override
  State<AppointmentsTimePicker> createState() => _AppointmentsTimePickerState();
}

class _AppointmentsTimePickerState extends State<AppointmentsTimePicker> {
  int? selectedIndex; 
  bool isLoading = false;
  List<String> finalData = [];
  @override
  SliverPadding build(final BuildContext context) => SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    sliver: SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => BookAppointmentCubit(),
        child: Builder(
          builder: (final context) =>
              BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
                listener: (context, state) async {
                  await BlocProvider.of<BookAppointmentCubit>(
                    context,
                  ).getAppiontments(date: selectedDate.toString());
                  if (state is BookAppointmentLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  } else if (state is BookAppointmentSuccess) {
                    setState(() {
                      isLoading = false;
                      finalData = state.finalData;
                    });
                  }
                },
                builder: (context, state) => ModalProgressHUD(
                  inAsyncCall: isLoading,
                  child: Wrap(
                    spacing: 8,
                    children: List.generate(
                      finalData.length, (index) {
                      final time = TimeOfDay(
                        hour: (index / 2 + 9).toInt() % 24,
                        minute: index.isEven ? 0 : 30,
                      ).format(context);
                      final isSelected = selectedIndex == index;
                      return SizedBox(
                        width: (AppMediaQuery.width - 48) / 3,
                        child: ChoiceChip(
                          label: SizedBox.fromSize(
                            size: const Size.fromHeight(22),
                            child: IText(time, textAlign: TextAlign.center),
                          ),
                          selected: isSelected,
                          checkmarkColor: AppColors.red,
                          onSelected: (value) {
                            setState(() {
                              selectedIndex = index;
                            });
                            print(time);
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
        ),
      ),
    ),
  );
}
