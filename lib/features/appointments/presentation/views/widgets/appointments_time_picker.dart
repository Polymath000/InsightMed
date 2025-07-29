import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/app_media_query.dart';
import '../../../../../core/helpers/custom_show_snackBar.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';

class AppointmentsTimePicker extends StatefulWidget {
  final void Function(String selectedTime)? onTimeSelected;

  AppointmentsTimePicker({
    required this.selectedDateTime,
    super.key,
    this.onTimeSelected,
  });
  DateTime selectedDateTime;
  @override
  State<AppointmentsTimePicker> createState() => _AppointmentsTimePickerState();
}

class _AppointmentsTimePickerState extends State<AppointmentsTimePicker> {
  int? selectedIndex;

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
              customShowSnackBar(
                context: context,
                message: 'There was an error ,please try again later',
              );
            }
          },
          builder: (final context, final state) {
            if (state is BookAppointmentLoading) {
              return const Center(
                heightFactor: 5,
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetAppointmentSuccess) {
              if (state.finalData.isEmpty) {
                return const Center(
                  child: IText('No available slots for this day.'),
                );
              }
              return Wrap(
                spacing: 5,
                runSpacing: 2,
                children: List.generate(state.finalData.length, (final index) {
                  final time = state.finalData[index];
                  final isSelected = selectedIndex == index;
                  return AbsorbPointer(
                    absorbing:
                        isBooked ||
                        (widget.selectedDateTime.year == DateTime.now().year &&
                            widget.selectedDateTime.month ==
                                DateTime.now().month &&
                            widget.selectedDateTime.day == DateTime.now().day &&
                            DateTime(
                              widget.selectedDateTime.year,
                              widget.selectedDateTime.month,
                              widget.selectedDateTime.day,
                              int.parse(time.split(':')[0]),
                              int.parse(time.split(':')[1]),
                            ).isBefore(DateTime.now())),
                    child: SizedBox(
                      width: (AppMediaQuery.width - 56) / 4,
                      child: ChoiceChip(
                        label: IText(time, textAlign: TextAlign.center),
                        selected: isSelected,
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        onSelected: (final selected) {
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