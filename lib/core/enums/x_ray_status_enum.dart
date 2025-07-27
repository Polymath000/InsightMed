import 'dart:ui';

import '../extensions/string_extension.dart';
import '../utls/themes/app_colors.dart';

enum XRayStatusEnum {
  noraml,
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

  Color get color => xRayStatusEnumMapColor[this]!;
}

Map<XRayStatusEnum, Color> xRayStatusEnumMapColor = {
  XRayStatusEnum.noraml: AppColors.green,
  XRayStatusEnum.nodule: AppColors.grey,
  XRayStatusEnum.infiltration: AppColors.amber,
  XRayStatusEnum.cardiomegaly: AppColors.purple,
  XRayStatusEnum.emphysema: AppColors.orange,
  XRayStatusEnum.pneumonia: AppColors.red,
  XRayStatusEnum.atelectasis: AppColors.lightBlue,
  XRayStatusEnum.effusion: AppColors.navyBlue,
};
