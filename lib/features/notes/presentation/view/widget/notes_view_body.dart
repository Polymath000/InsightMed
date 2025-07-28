import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/get_notes_cubit/get_notes_cubit.dart';
import 'note_card.dart';
import 'set_note_dialog.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({required this.patientId, super.key});
  final int patientId;

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<GetNotesCubit, GetNotesState>(
        builder: (final context, final state) {
          if (state is GetNotesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetNotesSuccess) {
            final notes = state.notes;
            return Column(
              children: [
                ListTile(
                  title: const Text('All Notes'),
                  trailing: TextButton.icon(
                    onPressed: () =>
                        setNoteDialog(context, patientId: patientId),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Note'),
                  ),
                ),
                if (notes.isEmpty)
                  const Text('No notes found')
                else
                  ...notes.map(
                    (final note) =>
                        NoteCard(note: note, index: notes.indexOf(note)),
                  ),
              ],
            );
          }
          return const Center(child: Text('Something went wrong'));
        },
      );
}
