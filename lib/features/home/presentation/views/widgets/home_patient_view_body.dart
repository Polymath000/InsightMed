import 'package:flutter/material.dart'
    show
        Card,
        CircularProgressIndicator,
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
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/i_text.dart' show IRichText, IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import '../../../domain/entities/dashboard_entity.dart';
import '../../controllers/user_dashboard_cubit/user_dashboard_cubit.dart';
import 'home_app_bar.dart' show HomeAppBar;
import 'home_sticker.dart';
import 'sticker_note.dart';
import 'sticker_ray.dart';

final class HomePatientViewBlocBuilder extends StatelessWidget {
  const HomePatientViewBlocBuilder({super.key});

  @override
  BlocBuilder build(final BuildContext context) =>
      BlocBuilder<UserDashboardCubit, UserDashboardState>(
        builder: (final context, final state) {
          if (state is UserDashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserDashboardSuccess) {
            return HomePatientViewBody(dashboard: state.dashboard);
          }
          return const Center(child: Text('Something went wrong'));
        },
      );
}

class HomePatientViewBody extends StatelessWidget {
  const HomePatientViewBody({required this.dashboard, super.key});
  final DashboardEntity dashboard;
  @override
  Widget build(final BuildContext context) {
    final rays = dashboard.rays;
    final notes = dashboard.notes;
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        StickerNote(notes: notes),
        StickerRay(rays: rays),
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
}
