import 'package:flutter/cupertino.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../../core/widgets/custbutton.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class NoteForm extends StatelessWidget {
  NoteForm({super.key});
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(final BuildContext context) => Form(
    key: formKey,
    autovalidateMode: autovalidateMode,
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
        CTextField(choose: false, hint: 'Note Title', onChanged: (p0) {}),
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
          onChanged: (p0) {},
          maxLines: 15,
          minLines: 15,
        ),

        const SizedBox(height: 16),

        CButton(
          btnText: 'Add Note',
          colorbackground: AppColors.primary,
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Navigator.pop(context);
            } else {
              autovalidateMode = AutovalidateMode.always;
            }
          },
        ),
      ],
    ),
  );
}
