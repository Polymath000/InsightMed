import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../domain/entities/note_entity.dart';
import 'notes_view_body.dart';

class NotesViewBodySkeletonizer extends StatelessWidget {
  const NotesViewBodySkeletonizer({super.key});

  @override
  Widget build(_) => Skeletonizer(
    child: NotesViewBody(
      patientId: 0,
      notes: List.generate(
        5,
        (final index) => NoteEntity(
          id: index,
          title: 'Title $index',
          note: 'Note $index',
          patientId: 0,
          rayId: '',
          createdAt: DateTime.now(),
        ),
      ),
    ),
  );
}
