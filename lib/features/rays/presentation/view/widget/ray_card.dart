import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/borders.dart';
import '../../../../../core/entities/ray_entity.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import 'differential_diagnosis_widget.dart';

class RayCard extends StatelessWidget {
  const RayCard({required this.ray, super.key});

  final RayEntity ray;

  @override
  Widget build(final BuildContext context) => Card.filled(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CachedNetworkImage(
              imageUrl: ray.imagePath ?? '',
              placeholder: (_, final url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (final context, final url, final error) =>
                  const Icon(Icons.error),
              height: 48,
              width: 48,
            ),
            title: const Text(
              'Chest X-Ray 1',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Uploaded: ${DateFormat.yMMMd().format(ray.createdAt!)}',
            ),
            trailing: DecoratedBox(
              decoration: ShapeDecoration(
                color: ray.aiStatus?.color.withAlpha(50),
                shape: const RoundedSuperellipseBorder(
                  borderRadius: AppBorders.xxxs,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  ray.aiStatus.toString(),
                  style: TextStyle(
                    color: ray.aiStatus?.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Confidence Level',
            style: AppTextStyles.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          LinearProgressIndicator(
            color: AppColors.green,
            minHeight: 8,
            value: (ray.aiConfidence?.toDouble() ?? 0) / 100,
          ),
          const SizedBox(height: 16),
          Text(
            ray.aiSummary ?? '',
            // 'Patchy opacities in right lower lobe consistent with pneumonia.'
            // ' Recommend clinical correlation.',
            style: AppTextStyles.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          const DifferentialDiagnosisWidget(),
        ],
      ),
    ),
  );
}
