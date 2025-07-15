import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/constans.dart';
import 'widgets/patient_form.dart';
import 'widgets/top_part_patient_info.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({super.key});
  static const String routeName = 'patientInfo';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Patient Information',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.sp,
          color: kSmain,
        ),
      ),
      // actions: [Icon(Icons.help)],
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
      child: ListView(
        children: [
          const TopPartPatientInfo(),
          SizedBox(height: MediaQuery.of(context).size.height / 100),
          const PatientForm(),
        ],
      ),
    ),
  );
}
