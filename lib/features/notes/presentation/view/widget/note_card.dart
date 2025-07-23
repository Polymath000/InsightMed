import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/helpers/shape_decoration.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.title, required this.description, required this.createdDate, required this.images, super.key,
  });
  final String title;
  final String description;
  final DateTime createdDate;
  final List<SvgPicture> images;
  @override
  Widget build(final BuildContext context) => Container(
    decoration: shapeDecoration,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              createdDate.toString(),
              style: AppTextStyles.bodyMedium!.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: AppTextStyles.bodyLarge,
        ),
        const SizedBox(height: 10),

        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.edit_note_outlined, color: AppColors.darkGrey, size: 30),
            Icon(Icons.delete, color: AppColors.darkGrey, size: 30),
          ],
        ),
        Row(
          children: images,
        ),
      ],
    ),
  );
}
