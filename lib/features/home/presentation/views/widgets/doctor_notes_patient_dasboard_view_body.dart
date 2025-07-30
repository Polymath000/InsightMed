import 'package:flutter/material.dart';

import '../../../../notes/domain/entities/note_entity.dart';
import 'notes_card_patient_dashboard.dart';

class DoctorNotesPatientDasboardViewBody extends StatelessWidget {
  const DoctorNotesPatientDasboardViewBody({required this.notes, super.key});
  final List<NoteEntity> notes;
  static const String routeName = 'doctorNotesPatientDasboardView';

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('All Notes')),
    body: Column(
      children: [
        if (notes.isEmpty)
          const Text('No notes found')
        else
          ...notes.map(
            (final note) => NoteCardPatientDashboard(
              note: note,
              index: notes.indexOf(note),
            ),
          ),
      ],
    ),
  );
}
