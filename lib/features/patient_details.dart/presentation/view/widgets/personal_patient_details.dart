import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_text_style.dart';
import '../../../../notes/presentation/view/widget/dropdown_menu.dart';

class PersonalPatientDetails extends StatelessWidget {
  const PersonalPatientDetails({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 25, left: 32, right: 32),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Abdelrahman Khaled',
              style: AppTextStyles.headlineSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '30 Years',
                    style: AppTextStyles.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 20),
    
                  Text(
                    'Male',
                    style: AppTextStyles.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const CustomDropdownMenu(),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
}
