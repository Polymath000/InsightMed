import 'package:flutter/material.dart'
    show
        Card,
        CircularProgressIndicator,
        Column,
        CrossAxisAlignment,
        CustomScrollView,
        FontWeight,
        Icon,
        IconAlignment,
        Icons,
        ListTile,
        MainAxisAlignment,
        MainAxisSize,
        PlaceholderAlignment,
        ScaffoldMessenger,
        SizedBox,
        SnackBar,
        StatelessWidget,
        TextButton,
        TextSpan,
        TextStyle,
        WidgetSpan;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider;

import '../../../../../core/constants/borders.dart';
import '../../../../../core/entities/ray_entity.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/i_text.dart' show IRichText, IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import '../../../../rays/cubit/get_rays/get_rays_cubit.dart';
import '../../../../rays/presentation/view/widget/ray_card.dart';
import 'decorated_icon.dart';
import 'home_app_bar.dart' show HomeAppBar;
import 'home_sticker.dart';
import 'ray_results_and_ai_summary.dart';

final class HomePatientViewBody extends StatelessWidget {
  const HomePatientViewBody({super.key});

  @override
  CustomScrollView build(final BuildContext context) => CustomScrollView(
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
