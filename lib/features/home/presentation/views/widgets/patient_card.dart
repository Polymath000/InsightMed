import 'package:flutter/material.dart';

import '../../../../../core/constants/borders.dart' show AppBorders;
import '../../../../../core/entities/user_entity.dart' show UserEntity;
import '../../../../../core/enums/patient_enum.dart';
import '../../../../../core/helpers/on_generate_routes.dart';
import 'patiend_status_text.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({required this.patient, super.key});

  final UserEntity patient;

  @override
  Widget build(final BuildContext context) => Card.filled(
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xxs),
    child: ListTile(
      onTap: () => AppRoutes.patientDetails(context, patient: patient),
      title: Text(patient.name!),
      subtitle: Text(
        '${patient.age} years | ${patient.gender}',
      ),
      trailing: PatiendStatusText(
        status: patient.status ?? PatientStatusEnum.newPatient,
      ),
    ),
  );
}
