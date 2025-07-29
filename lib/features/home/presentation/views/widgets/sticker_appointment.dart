import 'package:flutter/material.dart'
    show
        Card,
        Column,
        FontWeight,
        Icons,
        MainAxisAlignment,
        SizedBox,
        StatelessWidget,
        TextStyle;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../../../../core/entities/appointment_entity.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import 'home_sticker.dart';

class StickerAppointment extends StatelessWidget {
  const StickerAppointment({required this.appointment, super.key});
  final AppointmentEntity appointment;
  @override
  Widget build(_) {
    final appointmentTime = appointment.appointmentTime;
    final day = appointmentTime?.day;
    final monthName = DateFormat.MMM()
        .format(appointmentTime ?? DateTime.now())
        .toUpperCase();
    final time = DateFormat.jm().format(appointmentTime ?? DateTime.now());
    final timeAfter45Min = DateFormat.jm().format(
      appointmentTime?.add(const Duration(minutes: 45)) ?? DateTime.now(),
    );
    return HomeSticker(
      headerIcon: Icons.calendar_month_rounded,
      headerTitle: 'Next Appointment',
      headerColor: AppColors.pickledBluewood,
      bodyLeading: Card.filled(
        child: SizedBox(
          width: 32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IText(
                monthName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              IText(
                day.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      bodyTitle: 'Follow-up Consultation',
      bodySubTitle: IText('$time - $timeAfter45Min'),
    );
  }
}
