import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helpers/patient_info_screen_arguments.dart';
import 'widgets/constans.dart';
import 'widgets/patient_form.dart';
import 'widgets/top_part_patient_info.dart';

class PatientInformation extends StatefulWidget {
  PatientInformation({required this.patientInfo, super.key});
  final PatientInfoScreenArguments patientInfo;

  static const String routeName = 'patientInfo';

  @override
  State<PatientInformation> createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  bool isLoading = false;

  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: isLoading,
    child: Scaffold(
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
            PatientForm(
              patient: widget.patientInfo.patient,
              onLoadingChanged: (bool isLoad) {
                setState(() {
                  isLoading = isLoad;
                });
              },
            ),
          ],
        ),
      ),
    ),
  );
}
