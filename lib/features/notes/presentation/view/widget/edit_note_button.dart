import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import 'show_dialog_for_delete_note.dart';

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({super.key});

  @override
  Widget build(final BuildContext context) => InkWell(
    onTap: () async {
      await showDialogForDeleteNote(context: context);
    },
    child: const Icon(Icons.delete, color: AppColors.darkGrey, size: 30),
  );
}
