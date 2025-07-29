import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../../core/utls/i_text.dart';
import '../../../../notes/domain/entities/note_entity.dart';

class NoteCardPatientDashboard extends StatelessWidget {
  const NoteCardPatientDashboard({required this.note, required this.index, super.key});
  final NoteEntity note;
  final int index;

  @override
  Widget build(final BuildContext context) => Card.filled(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    child: Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.note_rounded),
            title: IText('Note ${index + 1}'),
            subtitle: Text(DateFormat.yMMMd().format(note.createdAt!)),
            contentPadding: const EdgeInsets.only(left: 16, right: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(note.note!, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    ),
  );
}
