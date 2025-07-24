import 'package:flutter/material.dart';
import '../../../core/utls/themes/app_colors.dart';
import '../../../core/utls/themes/app_text_style.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(final BuildContext context) => SliverAppBar(
    expandedHeight: 130,
    toolbarHeight: 50,
    pinned: true,
    automaticallyImplyLeading: false,
    flexibleSpace: FlexibleSpaceBar(
      title: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            'My Profile',
            style: AppTextStyles.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
    backgroundColor: AppColors.lightGrey,
    shadowColor: AppColors.black,
    surfaceTintColor: AppColors.grey,
  );
}
