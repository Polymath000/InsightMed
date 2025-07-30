import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/on_generate_routes.dart' show AppRoutes;
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../domain/entities/note_entity.dart' show NoteEntity;
import '../../controllers/get_notes_cubit/get_notes_cubit.dart';
import '../../controllers/set_note_cubit/set_note_cubit.dart';

Future<dynamic> setNoteDialog(
  final BuildContext context, {
  required final int patientId,
  final NoteEntity? note,
}) => showAdaptiveDialog(
  context: context,
  barrierDismissible: false,
  builder: (_) {
    final formKey = GlobalKey<FormState>();
    // final titleController = TextEditingController(text: note?.title);
    final contentController = TextEditingController(text: note?.note);
    return AlertDialog.adaptive(
      scrollable: true,
      title: Text('${note == null ? 'Add' : 'Edit'} Note'),
      content: Form(
        key: formKey,
        child: AppTextField(
          controller: contentController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          labelText: 'Content',
          hintText: 'Note Content',
          validator: (final value) =>
              (value?.isNotEmpty ?? false) ? null : 'this field is required',
          onChanged: (final p0) {},
          maxLines: 8,
          minLines: 4,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => AppRoutes.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              final updatedNote = NoteEntity(
                id: note?.id ?? 127,
                // title: titleController.text,
                note: contentController.text,
                patientId: note?.patientId ?? patientId,
                // rayId: note?.rayId ?? '2',
                createdAt: note?.createdAt ?? DateTime.now(),
              );
              final cubit = context.read<SetNoteCubit>();
              if (note == null) {
                await cubit.addNote(updatedNote);
              } else {
                await cubit.updateNote(updatedNote);
              }
              if (context.mounted) {
                await context.read<GetNotesCubit>().getNotes();
              }
              AppRoutes.pop(context);
            }
          },
          style: TextButton.styleFrom(foregroundColor: AppColors.blue),
          child: Text(note == null ? 'Add' : 'Edit'),
        ),
      ],
    );
  },
);
