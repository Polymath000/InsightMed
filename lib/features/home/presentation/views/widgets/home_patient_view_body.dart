import 'package:flutter/material.dart'
    show
        Card,
        Column,
        CrossAxisAlignment,
        CustomScrollView,
        FontWeight,
        Icon,
        Icons,
        MainAxisAlignment,
        MainAxisSize,
        PlaceholderAlignment,
        SizedBox,
        StatelessWidget,
        TextSpan,
        TextStyle,
        WidgetSpan;
import 'package:flutter/widgets.dart';

import '../../../../../core/utls/i_text.dart' show IRichText, IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import 'doctor_notes_patient_dasboard_view.dart';
import 'home_app_bar.dart' show HomeAppBar;
import 'home_sticker.dart';
import 'ray_results_and_ai_summary.dart';

final class HomePatientViewBody extends StatelessWidget {
  const HomePatientViewBody({super.key});

  @override
  CustomScrollView build(final BuildContext context) => CustomScrollView(
    slivers: [
      const HomeAppBar(),
       DoctorNotesPatientDasboardView(),
      RayResultsAndAiSummary(),
      const HomeSticker(
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
                  'JUL',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                IText(
                  '05',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        bodyTitle: 'Follow-up Consultation',
        bodySubTitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IText('10:30 AM - 11:15 AM'),
            IRichText(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(Icons.location_on_rounded, size: 16),
                  ),
                  TextSpan(text: ' Neurology Center, Room 304'),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
