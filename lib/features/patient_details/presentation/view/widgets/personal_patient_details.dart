import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../notes/presentation/view/widget/dropdown_menu.dart';

class PersonalPatientDetails extends StatelessWidget {
  const PersonalPatientDetails({required this.patient, super.key});
  final UserEntity patient;

  @override
  Widget build(final BuildContext context) => Column(
    children: [
      ListTile(
        title: Text(patient.name!, style: const TextStyle(fontSize: 18)),
        subtitle: Text(
          '${patient.age} Years | ${patient.gender}',
          style: const TextStyle(fontSize: 16),
        ),
        trailing: CustomDropdownMenu(patient: patient),
      ),
      GestureDetector(
        onTap: () => callNumber(phoneNumber: patient.phoneNumber ?? ''),
        child: Row(
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.call),
            const SizedBox(width: 15),
            Text(patient.phoneNumber ?? 'No Phone Number Found!'),
          ],
        ),
      ),
    ],
  );
}

Future<void> callNumber({required String phoneNumber}) async {
  final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
  try {
    await launchUrl(uri);
  } catch (e) {
    print('Could not launch phone dialer: $e');
  }
}
