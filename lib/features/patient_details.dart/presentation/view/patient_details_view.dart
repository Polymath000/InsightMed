import 'package:flutter/material.dart';

import 'widgets/patient_details_view_body.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({super.key});
  static const String routeName = 'patientDetails';
  @override
  Widget build(final BuildContext context) =>  const Scaffold(

    body: const PatientDetailsViewBody(),
  );
}
