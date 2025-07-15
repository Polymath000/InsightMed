import 'package:flutter/material.dart';

import '../../../../../core/utls/themes/app_colors.dart';
import 'patient_tabs_view.dart';
import 'personal_patient_details.dart';

class PatientDetailsViewBody extends StatelessWidget {
  const PatientDetailsViewBody({super.key});

  @override
  Widget build(final BuildContext context) => Container(

    child: Column(
      children: [
        Container(
              color: AppColors.white,
          child: const Column(
            children: [
              PersonalPatientDetails(),
              Divider(height: 0,),
            ],
          ),
        ),
        PatientTabsView(),
      ],
    ),
  );
}
