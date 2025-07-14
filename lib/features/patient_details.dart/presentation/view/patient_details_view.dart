import 'package:flutter/material.dart';

import '../../../../core/utls/themes/app_colors.dart';
import '../../../../core/utls/themes/app_text_style.dart';
import 'widgets/patient_details_view_body.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key});
  static const String routeName = 'patientDetails';
  @override
  Widget build(final BuildContext context) =>  Scaffold(
    appBar: AppBar(
                  shape: const RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFE5E7EB)),
            ),
        backgroundColor: AppColors.white,
        shadowColor: AppColors.black,
        surfaceTintColor: AppColors.grey,
      title:  Text('Patient Details',
                 style: AppTextStyles.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      ),
    ),
    body: const SingleChildScrollView(
      child: PatientDetailsViewBody()
      ),
  );
}
