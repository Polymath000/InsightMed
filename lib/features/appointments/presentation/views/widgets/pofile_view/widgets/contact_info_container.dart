import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';
import 'form_decoration.dart';
import 'icon_label.dart';
import 'label_text.dart';

class ContactInfoContainer extends StatelessWidget {
  const ContactInfoContainer({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    width: 358.w,
    height: 173.h,
    decoration: formDecoration(),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Row(
            children: [
              IconsLabel(icon: Icons.phone_outlined),
              LabelText(labelText: ' Phone Number'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const CTextField(
            choose: false,
            hint: 'Enter your phone number',
            type: TextInputType.number,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const Row(
            children: [
              IconsLabel(icon: Icons.mail_outlined),

              LabelText(labelText: ' Email Address'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const CTextField(
            choose: false,
            hint: 'Enter your email',
            type: TextInputType.emailAddress,
          ),
        ],
      ),
    ),
  );
}
