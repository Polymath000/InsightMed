import 'package:flutter/material.dart';

import '../../../../core/entities/user_entity.dart';
import 'widgets/patient_details_view_body.dart';

class PatientDetailsView extends StatelessWidget {
  const PatientDetailsView({required this.patient, super.key});
  final UserEntity patient;
  static const String routeName = 'patientDetails';
  @override
  Widget build(final BuildContext context) =>
      Scaffold(body: PatientDetailsViewBody(patient: patient));
}
