import 'package:flutter/material.dart'
    show Card, Icon, Icons, ListTile, StatelessWidget;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../../../../core/entities/ray_entity.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import 'decorated_icon.dart' show DecoratedIcon;
import 'home_sticker.dart';

class StickerRay extends StatelessWidget {
  const StickerRay({required this.rays, super.key});
  final List<RayEntity>? rays;
  @override
  Widget build(final BuildContext context) {
    final firstRay = (rays?.isNotEmpty ?? false) ? rays!.first : null;
    final isNotEmpty = rays?.isNotEmpty ?? false;
    final color = isNotEmpty
        ? (firstRay?.aiStatus?.color ?? AppColors.topaz)
        : AppColors.grey;
    final dateFormat = DateFormat.yMMMd().format(
      firstRay?.createdAt ?? DateTime.now(),
    );
    return HomeSticker(
      headerIcon: Icons.medical_services_rounded,
      headerTitle: 'Ray Results & AI Summary',
      headerColor: color,
      bodyLeading: DecoratedIcon(icon: Icons.image_rounded, color: color),
      bodyTitle: 'Latest Chest X-Ray Scan',
      bodySubTitle: IText(
        isNotEmpty ? 'Uploaded: $dateFormat' : 'No scans yet',
      ),
      bodyTrailing: const Icon(Icons.arrow_forward_ios_rounded),
      bodyOnTap: isNotEmpty ? () {} : null,
      paragraph: Card.filled(
        child: ListTile(
          title: const IText('AI Summary'),
          subtitle: IText(
            firstRay?.aiSummary ?? 'The AI summary is currently unavailable',
            softWrap: true,
          ),
        ),
      ),
      footerOnPressed: isNotEmpty
          ? () => AppRoutes.rayResultsPatientDashboard(context, rays: rays!)
          : null,
      footerTitle: 'View all results',
    );
  }
}
