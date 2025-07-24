import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

<<<<<<<< HEAD:lib/features/pofile_view/widgets/icon_label.dart
import '../../auth/presentation/views/widgets/constans.dart';
========
import '../../../../auth/presentation/views/widgets/constans.dart';
>>>>>>>> a59d91dea705fccd82a5e530ec2865504956cc08:lib/features/pofile/presentation/views/widgets/icon_label.dart

class IconsLabel extends StatelessWidget {
  const IconsLabel({super.key, this.icon});
  final IconData? icon;
  @override
  Widget build(final BuildContext context) =>
      Icon(icon, color: kMainColor, size: 20.sp);
}
