import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../domain/entities/note_entity.dart';
import '../../controllers/get_notes_cubit/get_notes_cubit.dart';
import '../../controllers/set_note_cubit/set_note_cubit.dart';

Future<void> deleteNoteDialog(
  final BuildContext context, {
  required final NoteEntity note,
}) => showDialog(
  context: context,
  builder: (_) => AlertDialog(
    title: const Text('Delete Note'),
    content: const Text('Are you sure you want to delete this note?'),
    actions: [
      TextButton(
        onPressed: () => AppRoutes.pop(context),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () async {
          if (context.mounted) {
            AppRoutes.pop(context);
          }
          await context.read<SetNoteCubit>().deleteNote(note);
          if (context.mounted) {
            await context.read<GetNotesCubit>().getNotes();
          }
        },
        style: TextButton.styleFrom(foregroundColor: AppColors.red),
        child: const Text('Delete'),
      ), 
    ],
  ),
);
