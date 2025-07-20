import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utls/app_images.dart';
import '../../../../core/utls/themes/app_text_style.dart';
import 'widget/add_note_button.dart';
import 'widget/note_card.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('All Notes', style: AppTextStyles.displaySmall),
            ),
            const AddNoteButton(),
          ],
        ),
        const SizedBox(height: 20),
        NoteCard(
          title: 'Note Title edsfe ferfedffesdf djkhf sdhf jj jfi jd',
          description:
              'Patient reported improvement in sleep patterns '
              'after medication adjustment. Blood pressure '
              'readings are now within normal range (120/80). '
              'readings are now within normal range (120/80).',
          createdDate: DateTime.now(),
          images: [
            SvgPicture.asset(Assets.assetsImagesRay1),
            SvgPicture.asset(Assets.assetsImagesRay2),
          ],
        ),
        const SizedBox(height: 20),
        NoteCard(
          title: 'Note Title edsfe ferfedffesdf djkhf sdhf jj jfi jd',
          description:
              'Patient reported improvement in sleep patterns '
              'after medication adjustment. Blood pressure '
              'readings are now within normal range (120/80). '
              'readings are now within normal range (120/80).',
          createdDate: DateTime.now(),
          images: [
            SvgPicture.asset(Assets.assetsImagesRay1),
            SvgPicture.asset(Assets.assetsImagesRay2),
          ],
        ),
        const SizedBox(height: 20),
        NoteCard(
          title: 'Note Title edsfe ferfedffesdf djkhf sdhf jj jfi jd',
          description:
              'Patient reported improvement in sleep patterns '
              'after medication adjustment. Blood pressure '
              'readings are now within normal range (120/80). '
              'readings are now within normal range (120/80).',
          createdDate: DateTime.now(),
          images: [
            SvgPicture.asset(Assets.assetsImagesRay1),
            SvgPicture.asset(Assets.assetsImagesRay2),
          ],
        ),
      ],
    ),
  );
}
