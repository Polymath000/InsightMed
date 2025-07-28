import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/app_media_query.dart';
import '../../../../../core/utls/i_text.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../cubit/book_appointment/book_appointment_cubit.dart';
import 'appointments_date_picker.dart';

class AppointmentsTimePicker extends StatefulWidget {
  final void Function(String selectedTime)? onTimeSelected;

  const AppointmentsTimePicker({super.key, this.onTimeSelected});

  @override
  State<AppointmentsTimePicker> createState() => _AppointmentsTimePickerState();
}

class _AppointmentsTimePickerState extends State<AppointmentsTimePicker> {
  int? selectedIndex;

  @override
  Widget build(final BuildContext context) => SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    sliver: SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) =>
            BookAppointmentCubit()
              ..getAppiontments(date: selectedDate.toString()),
        child: BlocConsumer<BookAppointmentCubit, BookAppointmentState>(
          listener: (final context, state) {
            if (state is BookAppointmentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is BookAppointmentLoading) {
              return const Center(
                heightFactor: 5,
                child: CircularProgressIndicator(),
              );
            }

            if (state is BookAppointmentSuccess) {
              if (state.finalData.isEmpty) {
                return const Center(
                  child: IText('No available slots for this day.'),
                );
              }

              return Wrap(
                spacing: 5,
                runSpacing: 2,
                children: List.generate(state.finalData.length, (index) {
                  final time = state.finalData[index];
                  final isSelected = selectedIndex == index;
                  return SizedBox(
                    width: (AppMediaQuery.width - 56) / 4,
                    child: ChoiceChip(
                      label: IText(time, textAlign: TextAlign.center),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedIndex = index;
                          });
                          widget.onTimeSelected?.call(
                            selectedDate.toString().substring(0, 11) +
                                time +
                                ":00",
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
    ),
  );
}
