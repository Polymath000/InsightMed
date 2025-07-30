import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/get_notes_cubit/get_notes_cubit.dart';
import 'notes_view_body.dart';
import 'notes_view_body_skeletonizer.dart';

class NotesViewBlocBuilder extends StatelessWidget {
  const NotesViewBlocBuilder({required this.patientId, super.key});
  final int patientId;

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<GetNotesCubit, GetNotesState>(
        builder: (final context, final state) {
          if (state is GetNotesLoading) {
            return const NotesViewBodySkeletonizer();
          }
          if (state is GetNotesSuccess) {
            return NotesViewBody(patientId: patientId, notes: state.notes);
          }
          return const Center(child: Text('Something went wrong'));
        },
      );
}
