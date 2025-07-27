import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utls/app_images.dart';
import 'widget/note_card.dart';
import 'widget/note_form.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      ListTile(
        title: const Text('All Notes'),
        trailing: TextButton.icon(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Add Note Form'),
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: const SingleChildScrollView(child: NoteForm()),
              ),
            ),
          ),
          icon: const Icon(Icons.add),
          label: const Text('Add Note'),
        ),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Align(
      //       alignment: Alignment.topLeft,
      //       child: Text('All Notes', style: AppTextStyles.displaySmall),
      //     ),
      //     const AddNoteButton(),
      //   ],
      // ),
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
          SvgPicture.asset(
            Assets.assetsImagesXRaysChestIcon,
            height: 64,
            width: 64,
          ),
          SvgPicture.asset(Assets.assetsImagesRay2),
          SvgPicture.asset(Assets.assetsImagesRay2),
        ],
      ),
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
  );
}
