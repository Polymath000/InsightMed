import 'package:flutter/material.dart';

import '../../../../../core/constants/borders.dart' show AppBorders;
import '../../../../../core/entities/user_entity.dart' show UserEntity;
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
      // leading: const CircleAvatar(),
      title: Text(patient.name!),
      subtitle: Text(
        '${patient.age} years | ${patient.gender}',
        // '\nLast visit: '
        // '${DateTime.now().difference(patient.lastVisit!).inDays} '
        // 'days ago',
      ),
      trailing: PatiendStatusText(status: patient.status!),
    ),
  );
}
