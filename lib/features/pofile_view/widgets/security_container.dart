import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'form_decoration.dart';
import 'icon_label.dart';
import 'label_text.dart';

class SecurityContainer extends StatelessWidget {
  const SecurityContainer({super.key});

  @override
  Widget build(final BuildContext context) => Container(
    width: 358.w,
    height: 47.h,
    decoration: FormDecoration(),
    child: const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconsLabel(icon: Icons.lock_outlined),

                  LabelText(labelText: ' Change Password'),
                ],
              ),
              Icon(Icons.arrow_right_outlined),
            ],
          ),
        ],
      ),
    ),
  );
}
