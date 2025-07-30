import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/app_media_query.dart';
import '../../../../../core/helpers/custom_show_snackBar.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';

class AppointmentsTimePicker extends StatefulWidget {
  const AppointmentsTimePicker({
    required this.selectedDateTime,
    super.key,
    this.onTimeSelected,
    this.onSelectDate,
  });
  final void Function(String selectedTime)? onTimeSelected;
  final DateTime selectedDateTime;
  final ValueChanged<bool>? onSelectDate;

  @override
  State<AppointmentsTimePicker> createState() => _AppointmentsTimePickerState();
}

class _AppointmentsTimePickerState extends State<AppointmentsTimePicker> {
  int? selectedIndex;
  bool isBook = SharedPreferencesSingleton.getBool(isBookedKey) ?? false;
  @override
  Widget build(final BuildContext context) {
    var isBooked = SharedPreferencesSingleton.getBool(isBookedKey) ?? false;
    var selectedDate = widget.selectedDateTime.toString().substring(0, 11);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
          listener: (final context, final state) {
            if (state is BookAppointmentFailure) {
              widget.onSelectDate!(false);
              customShowSnackBar(
                context: context,
                message: 'There was an error ,please try again later',
              );
            }
          },
          builder: (final context, final state) {
            if (state is BookAppointmentLoading) {
              widget.onSelectDate!(true);
              return Skeletonizer(
                child: Wrap(
                  spacing: 5,
                  children: List.generate(
                    12,
                    (final index) => SizedBox(
                      width: (AppMediaQuery.width - 42) / 3,
                      child: ChoiceChip(
                        label: SizedBox(
                          width: (AppMediaQuery.width - 42) / 3,
                          child: const IText(
                            '00:00 AM',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        selected: false,
                        onSelected: (final selected) {},
                      ),
                    ),
                  ),
                ),
              );
            }
            if (state is GetAppointmentSuccess) {
              widget.onSelectDate!(false);
              if (state.finalData.isEmpty) {
                return const Center(
                  child: IText('No available slots for this day.'),
                );
              }
              return Wrap(
                spacing: 5,
                children: List.generate(state.finalData.length, (final index) {
                  final time = state.finalData[index];
                  final isSelected = selectedIndex == index;
                  final timeFomrated = DateFormat.jm().format(
                    DateTime.now().copyWith(
                      hour: int.parse(time.split(':')[0]),
                      minute: int.parse(time.split(':')[1]),
                    ),
                  );
                  return SizedBox(
                    width: (AppMediaQuery.width - 42) / 3,
                    child: ChoiceChip(
                      label: SizedBox(
                        width: (AppMediaQuery.width - 42) / 3,
                        child: IText(timeFomrated, textAlign: TextAlign.center),
                      ),
                      selected: isSelected,
                      onSelected:
                          isBooked ||
                              (widget.selectedDateTime.year ==
                                      DateTime.now().year &&
                                  widget.selectedDateTime.month ==
                                      DateTime.now().month &&
                                  widget.selectedDateTime.day ==
                                      DateTime.now().day &&
                                  DateTime(
                                    widget.selectedDateTime.year,
                                    widget.selectedDateTime.month,
                                    widget.selectedDateTime.day,
                                    int.parse(time.split(':')[0]),
                                    int.parse(time.split(':')[1]),
                                  ).isBefore(DateTime.now()))
                          ? null
                          : (final selected) {
                              if (selected) {
                                setState(() {
                                  selectedIndex = index;
                                });
                                widget.onTimeSelected?.call(
                                  '${selectedDate.substring(0, 11)}$time:00',
                                );
                              }
                            },
                    ),
                  );
                }),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
