import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/get_notes_cubit/get_notes_cubit.dart';
import '../controllers/set_note_cubit/set_note_cubit.dart';
import 'widget/notes_view_bloc_builder.dart';

class NotesView extends StatelessWidget {
  const NotesView({required this.patientId, super.key});
  final int patientId;
  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => SetNoteCubit()),
      BlocProvider(create: (_) => GetNotesCubit(patientId)),
    ],
    child: NotesViewBlocBuilder(patientId: patientId),
  );
}
