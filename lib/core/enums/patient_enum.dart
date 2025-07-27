import 'package:flutter/material.dart';

import '../utls/themes/app_colors.dart';

enum PatientStatusEnum {
  critical,
  newPatient,
  followUp,
  regular;

  const PatientStatusEnum();

  @override
  String toString() => _patientEnumMapString[this]!;

  Color get color => _patientEnumMapColor[this]!;
}

const Map<PatientStatusEnum, String> _patientEnumMapString = {
  PatientStatusEnum.critical: 'Critical',
  PatientStatusEnum.followUp: 'Follow-up',
  PatientStatusEnum.newPatient: 'New',
  PatientStatusEnum.regular: 'Regular',
};

const Map<PatientStatusEnum, Color> _patientEnumMapColor = {
  PatientStatusEnum.critical: AppColors.red,
  PatientStatusEnum.followUp: AppColors.mediumBrown,
  PatientStatusEnum.newPatient: AppColors.green,
  PatientStatusEnum.regular: AppColors.blue,
};
