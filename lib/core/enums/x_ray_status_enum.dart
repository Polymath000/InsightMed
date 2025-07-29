import 'dart:ui';

import '../extensions/string_extension.dart';
import '../utls/themes/app_colors.dart';

enum XRayStatusEnum {
  normal,
  nodule,
  infiltration,
  cardiomegaly,
  emphysema,
  pneumonia,
  atelectasis,
  effusion;

  const XRayStatusEnum();

  @override
  String toString() => name.capitalize;

  Color get color => _xRayStatusEnumMapColor[this]!;
}

const Map<XRayStatusEnum, Color> _xRayStatusEnumMapColor = {
  XRayStatusEnum.normal: AppColors.green,
  XRayStatusEnum.nodule: AppColors.grey,
  XRayStatusEnum.infiltration: AppColors.amber,
  XRayStatusEnum.cardiomegaly: AppColors.purple,
  XRayStatusEnum.emphysema: AppColors.orange,
  XRayStatusEnum.pneumonia: AppColors.red,
  XRayStatusEnum.atelectasis: AppColors.lightBlue,
  XRayStatusEnum.effusion: AppColors.navyBlue,
};
