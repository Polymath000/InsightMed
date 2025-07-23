import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import 'note_form.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: () async {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Add Note Form'),
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(child: NoteForm.AddNoteForm()),
          ),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: AppColors.white, size: 20),
          const SizedBox(width: 6),
          Text(
            'Add Note',
            style: AppTextStyles.bodyLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
