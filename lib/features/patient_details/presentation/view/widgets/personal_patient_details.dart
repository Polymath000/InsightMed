import 'package:flutter/material.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../notes/presentation/view/widget/dropdown_menu.dart';

class PersonalPatientDetails extends StatelessWidget {
  const PersonalPatientDetails({required this.patient, super.key});
  final UserEntity patient;

  @override
  Widget build(final BuildContext context) => ListTile(
    title: Text(patient.name!, style: const TextStyle(fontSize: 18)),
    subtitle: Text(
      '${patient.age} Years | ${patient.gender}',
      style: const TextStyle(fontSize: 16),
    ),
    trailing: CustomDropdownMenu(patient: patient),
  );
}
