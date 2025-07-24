import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../auth/presentation/views/widgets/radio_btn.dart';
import 'icon_label.dart';
import 'label_text.dart';

class PersonalContainer extends StatelessWidget {
  const PersonalContainer({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    width: 358.w,
    height: 242.h,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
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
          RadioBtn(onChanged: (_) {}),
        ],
      ),
    ),
  );
}
