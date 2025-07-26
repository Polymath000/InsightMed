import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/entities/user_entity.dart';
import 'widgets/patient_form.dart';
import 'widgets/top_part_patient_info.dart';

class PatientInformation extends StatefulWidget {
  const PatientInformation({required this.user, super.key});
  final UserEntity user;

  static const String routeName = 'patientInfo';

  @override
  State<PatientInformation> createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  bool _isLoading = false;

  @override
  Widget build(final BuildContext context) => ModalProgressHUD(
    inAsyncCall: _isLoading,
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Patient Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const TopPartPatientInfo(),
            const SizedBox(height: 16),
            PatientForm(
              user: widget.user.copyWith(gender: 'male'),
              onLoadingChanged: ({final isLoading = false}) =>
                  setState(() => _isLoading = isLoading),
            ),
          ],
        ),
      ),
    ),
  );
}
