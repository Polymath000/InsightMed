import 'package:flutter/material.dart';

import '../../../domain/entities/note_entity.dart';
import 'note_card.dart';
import 'set_note_dialog.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    required this.patientId,
    required this.notes,
    super.key,
  });

  final int patientId;
  final List<NoteEntity> notes;

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      ListTile(
        title: Text(notes.isEmpty ? 'No Notes' : 'All Notes'),
        trailing: TextButton.icon(
          onPressed: () => setNoteDialog(context, patientId: patientId),
          icon: const Icon(Icons.add),
          label: const Text('Add Note'),
        ),
      ),
      ...notes.map(
        (final note) => NoteCard(note: note, index: notes.indexOf(note)),
      ),
    ],
  );
}
