import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field.dart';
import 'icon_label.dart';
import 'label_text.dart';

class ContactInfoContainer extends StatelessWidget {
  const ContactInfoContainer({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    decoration: const ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
      ],
    ),
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
          CTextField(
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
          CTextField(
            choose: false,
            hint: 'Enter your email',
            type: TextInputType.emailAddress,
          ),
        ],
      ),
    ),
  );
}
