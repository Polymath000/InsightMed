import 'package:flutter/cupertino.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({super.key});

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
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
          btnText: 'Edit Note',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              AppRoutes.pop(context);
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
