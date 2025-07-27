import 'package:flutter/material.dart';
import '../../../../../core/constants/borders.dart' show AppBorders;
import '../../../../../core/enums/patient_enum.dart' show PatientStatusEnum;

class PatiendStatusText extends StatelessWidget {
  const PatiendStatusText({required this.status, super.key});
  final PatientStatusEnum status;

  @override
  Widget build(_) => DecoratedBox(
    decoration: ShapeDecoration(
      color: status.color.withAlpha(50),
      shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xxxs),
    ),
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Text(
        status.toString(),
        style: TextStyle(fontSize: 12, color: status.color),
      ),
    ),
  );
}
