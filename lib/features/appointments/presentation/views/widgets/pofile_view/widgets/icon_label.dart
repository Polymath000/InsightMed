import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../auth/presentation/views/widgets/constans.dart';

class IconsLabel extends StatelessWidget {
  const IconsLabel({super.key, this.icon});
  final IconData? icon;
  @override
  Widget build(final BuildContext context) => Icon(icon, color: kMainColor, size: 20.sp);
}
