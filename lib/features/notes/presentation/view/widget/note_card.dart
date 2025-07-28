import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utls/i_text.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../domain/entities/note_entity.dart';
import 'set_note_dialog.dart';
import 'show_dialog_for_delete_note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({required this.note, super.key});
  final NoteEntity note;

  @override
  Widget build(final BuildContext context) => Card.filled(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: Padding(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.note_rounded),
            title: IText(note.title!),
            subtitle: Text(DateFormat.yMMMd().format(note.createdAt!)),
            trailing: IconButton.filledTonal(
              onPressed: () => setNoteDialog(
                context,
                note: note,
                patientId: note.patientId!,
              ),
              icon: const Icon(Icons.edit_note_rounded),
            ),
            contentPadding: const EdgeInsets.only(left: 16, right: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(note.note!, style: const TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton.filled(
                onPressed: () => deleteNoteDialog(context, note: note),
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
