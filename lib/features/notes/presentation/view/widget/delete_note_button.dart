import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import 'edit_note_form.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({super.key});

  @override
  Widget build(final BuildContext context) => InkWell(
    child: const Icon(
      Icons.edit_note_outlined,
      color: AppColors.darkGrey,
      size: 30,
    ),
    onTap: () async {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Edit Note Form'),
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(child: EditNoteForm.EditNoteForm()),
          ),
        ),
      );
    },
  );
}
