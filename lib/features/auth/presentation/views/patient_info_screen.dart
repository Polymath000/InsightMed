import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/patient_info_screen_arguments.dart';
import 'widgets/constans.dart';
import 'widgets/patient_form.dart';
import 'widgets/top_part_patient_info.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({super.key});
  static const String routeName = 'patientInfo';

  @override
  Widget build(final BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments!
            as PatientInfoScreenArguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Patient Information',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            color: kSmain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
        child: ListView(
          children: [
            const TopPartPatientInfo(),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            PatientForm(patient: args.patient),
          ],
        ),
      ),
    );
  }
}
