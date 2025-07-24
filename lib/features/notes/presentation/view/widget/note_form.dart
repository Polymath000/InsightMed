import 'package:flutter/cupertino.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) => Form(
    key: _formKey,
    autovalidateMode: _autovalidateMode,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: AppTextStyles.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
          softWrap: true,
        ),
        const SizedBox(height: 8),
        CTextField(choose: false, hint: 'Note Title', onChanged: (final p0) {}),
        const SizedBox(height: 16),
        Text(
          'Content',
          style: AppTextStyles.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
          softWrap: true,
        ),
        const SizedBox(height: 8),

        CTextField(
          choose: false,
          hint: 'Note Title',
          onChanged: (final p0) {},
          maxLines: 15,
          minLines: 15,
        ),

        const SizedBox(height: 16),

        CButton(
          btnText: 'Add Note',
          colorbackground: AppColors.primary,
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context);
            } else {
              _autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
        ),
      ],
    ),
  );
}
