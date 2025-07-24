import 'package:flutter/material.dart';

import '../../../core/helpers/shape_decoration.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../auth/presentation/views/widgets/radio_btn.dart';
import 'icon_label.dart';
import 'label_text.dart';

class PersonalContainer extends StatelessWidget {
  const PersonalContainer({super.key});

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
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            children: [
              IconsLabel(icon: Icons.person_2_outlined),
              LabelText(labelText: ' Full Name'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const CTextField(choose: false, hint: 'Enter your full name'),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const Row(
            children: [
              IconsLabel(icon: Icons.calendar_month_outlined),
              LabelText(labelText: ' Age'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const CTextField(
            choose: false,
            hint: 'Enter your age',
            type: TextInputType.number,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          const Row(
            children: [
              IconsLabel(icon: Icons.male_outlined),

              LabelText(labelText: ' Gender'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 105),
          RadioBtn(onChanged: (String) {}),
        ],
      ),
    ),
  );
}
