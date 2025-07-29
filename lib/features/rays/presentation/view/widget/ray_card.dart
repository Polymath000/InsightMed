import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/borders.dart';
import '../../../../../core/constants/end_ponits.dart';
import '../../../../../core/entities/ray_entity.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/utls/themes/app_colors.dart';

class RayCard extends StatelessWidget {
  const RayCard({required this.ray, required this.index, super.key});

  final RayEntity ray;
  final int index;

  @override
  Widget build(final BuildContext context) {
    log('${EndPoint.baseUrl}/${ray.imagePath}');
    return Card.filled(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CachedNetworkImage(
                imageUrl: '${EndPoint.baseUrl}/${ray.imagePath}',
                placeholder: (_, final url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (final context, final url, final error) =>
                    const Icon(Icons.error),
                height: 48,
                width: 48,
              ),
              title: Text(
                'Chest X-Ray $index',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Uploaded: ${DateFormat.yMMMd().format(ray.createdAt ?? DateTime.now())}',
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Confidence Level',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            LinearProgressIndicator(
              color: AppColors.green,
              minHeight: 8,
              value: (ray.aiConfidence?.toDouble() ?? 0) / 100,
            ),
            const SizedBox(height: 16),
            Text(
              ray.aiSummary ??
                  'Patchy opacities in right lower lobe consistent with '
                      'pneumonia.'
                      ' Recommend clinical correlation.',
            ),
          ],
        ),
      ),
    );
  }
}
