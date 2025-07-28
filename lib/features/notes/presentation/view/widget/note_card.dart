import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utls/i_text.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import 'edit_note_form.dart';
import 'show_dialog_for_delete_note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.title,
    required this.description,
    required this.createdDate,
    super.key,
  });
  final String title;
  final String description;
  final DateTime createdDate;
  @override
  Widget build(final BuildContext context) => Card.filled(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: Padding(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.note_rounded),
            title: IText(title),
            subtitle: Text(DateFormat.yMMMd().format(createdDate)),
            trailing: IconButton.filledTonal(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Edit Note Form'),
                  content: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const SingleChildScrollView(child: EditNoteForm()),
                  ),
                ),
              ),
              icon: const Icon(Icons.edit_note_rounded),
            ),
            contentPadding: const EdgeInsets.only(left: 16, right: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(description, style: const TextStyle(fontSize: 16)),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton.filled(
                onPressed: () => showDialogForDeleteNote(context: context),
                icon: const Icon(Icons.delete_rounded),
                style: IconButton.styleFrom(backgroundColor: AppColors.error),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
