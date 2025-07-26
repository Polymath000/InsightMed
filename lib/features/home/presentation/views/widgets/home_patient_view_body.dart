import 'package:flutter/material.dart'
    show
        Card,
        Column,
        CrossAxisAlignment,
        CustomScrollView,
        FontWeight,
        Icon,
        Icons,
        ListTile,
        MainAxisAlignment,
        MainAxisSize,
        PlaceholderAlignment,
        SizedBox,
        StatelessWidget,
        TextSpan,
        TextStyle,
        WidgetSpan;

import '../../../../../core/utls/i_text.dart' show IRichText, IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import 'decorated_icon.dart';
import 'home_app_bar.dart' show HomeAppBar;
import 'home_sticker.dart';

final class HomePatientViewBody extends StatelessWidget {
  const HomePatientViewBody({super.key});

  @override
  CustomScrollView build(_) => CustomScrollView(
    slivers: [
      const HomeAppBar(),
      HomeSticker(
        headerIcon: Icons.notes_rounded,
        headerTitle: 'Doctor Notes',
        headerColor: AppColors.waterBlue,
        bodyLeading: const DecoratedIcon(
          icon: Icons.calendar_month_rounded,
          color: AppColors.waterBlue,
        ),
        bodyTitle: 'Follow-up appointment notes',
        bodySubTitle: const IText('June 15, 2023'),
        paragraph: const IText(
          'Patient shows improvement in motor functions. '
          'Continue with current medication regimen '
          'and physical therapy twice weekly.',
          softWrap: true,
        ),
        footerOnPressed: () {},
        footerTitle: 'Read More',
      ),
      HomeSticker(
        headerIcon: Icons.medical_services_rounded,
        headerTitle: 'Ray Results & AI Summary',
        headerColor: AppColors.topaz,
        bodyLeading: const DecoratedIcon(
          icon: Icons.image_rounded,
          color: AppColors.topaz,
        ),
        bodyTitle: 'Brain MRI Scan',
        bodySubTitle: const IText('Uploaded: June 10, 2023'),
        bodyTrailing: const Icon(Icons.arrow_forward_ios_rounded),
        bodyOnTap: () {},
        paragraph: const Card.filled(
          child: ListTile(
            title: IText('AI Summary'),
            subtitle: IText(
              'No significant abnormalities detected. '
              'Minor inflammation in the temporal region has '
              'reduced by 30% compared to previous scan.',
              softWrap: true,
            ),
          ),
        ),
        footerOnPressed: () {},
        footerTitle: 'View all results',
      ),
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
