import 'package:flutter/material.dart';

import '../utls/themes/app_colors.dart';

enum PatientEnum {
  critical,
  newPatient,
  followUp,
  regular;

  const PatientEnum();

  @override
  String toString() => _patientEnumMapString[this]!;

  Color get color => _patientEnumMapColor[this]!;
}

const Map<PatientEnum, String> _patientEnumMapString = {
  PatientEnum.critical: 'Critical',
  PatientEnum.followUp: 'Follow-up',
  PatientEnum.newPatient: 'New',
  PatientEnum.regular: 'Regular',
};

const Map<PatientEnum, Color> _patientEnumMapColor = {
  PatientEnum.critical: AppColors.red,
  PatientEnum.followUp: AppColors.mediumBrown,
  PatientEnum.newPatient: AppColors.green,
  PatientEnum.regular: AppColors.blue,
};
