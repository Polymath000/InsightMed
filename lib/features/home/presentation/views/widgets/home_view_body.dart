import 'package:flutter/material.dart';

import '../../../../../core/constants/borders.dart';
import '../../../../../core/utls/i_text.dart' show IRichText, IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import 'home_app_bar.dart' show HomeAppBar;

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(_) => CustomScrollView(
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

class HomeSticker extends StatelessWidget {
  const HomeSticker({
    required this.headerIcon,
    required this.headerTitle,
    required this.headerColor,
    required this.bodyLeading,
    required this.bodyTitle,
    required this.bodySubTitle,
    this.bodyTrailing,
    this.bodyOnTap,
    this.paragraph,
    this.footerOnPressed,
    this.footerTitle,
    super.key,
  });
  final IconData headerIcon;
  final String headerTitle;
  final Color headerColor;
  final Widget bodyLeading;
  final String bodyTitle;
  final Widget bodySubTitle;
  final Widget? bodyTrailing;
  final VoidCallback? bodyOnTap;
  final Widget? paragraph;
  final VoidCallback? footerOnPressed;
  final String? footerTitle;

  @override
  Widget build(_) => SliverPadding(
    padding: const EdgeInsets.all(16),
    sliver: SliverToBoxAdapter(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xxs),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(headerIcon, color: AppColors.white),
              title: IText(headerTitle),
              tileColor: headerColor,
              textColor: AppColors.white,
            ),
            ListTile(
              leading: bodyLeading,
              title: IText(bodyTitle),
              subtitle: bodySubTitle,
              trailing: bodyTrailing,
              onTap: bodyOnTap,
              contentPadding: const EdgeInsets.only(left: 24, right: 32),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: paragraph,
            ),
            if (footerTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextButton.icon(
                  onPressed: footerOnPressed,
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  label: Text(footerTitle!),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(foregroundColor: headerColor),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

class DecoratedIcon extends StatelessWidget {
  const DecoratedIcon({required this.color, required this.icon, super.key});

  final Color color;
  final IconData icon;

  @override
  Widget build(_) => DecoratedBox(
    decoration: ShapeDecoration(
      color: color.withAlpha(50),
      shape: const RoundedRectangleBorder(borderRadius: AppBorders.xxl),
    ),
    child: SizedBox(width: 32, height: 40, child: Icon(icon, color: color)),
  );
}
