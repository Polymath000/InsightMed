import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/shape_decoration.dart';
import '../../../../../core/utls/app_images.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('All Notes', style: AppTextStyles.displaySmall),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: shapeDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Note Title edsfe ferfedffesdf djkhf sdhf jj jfi jd',
                        style: AppTextStyles.titleLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Today, 10:30 AM',
                      style: AppTextStyles.bodyMedium!.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Patient reported improvement in sleep patterns '
                  'after medication adjustment. Blood pressure '
                  'readings are now within normal range (120/80). '
                  'readings are now within normal range (120/80).',
                  style: AppTextStyles.bodyLarge,
                ),
                const SizedBox(height: 10),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.edit_note_outlined,
                      color: AppColors.darkGrey,
                      size: 30,
                    ),
                    Icon(
                      Icons.delete, 
                      color: AppColors.darkGrey, 
                      size: 30,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.assetsImagesRay1),
                    SvgPicture.asset(Assets.assetsImagesRay2),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
