import 'package:flutter/material.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(_) => SliverAppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        IText(
          'Good morning,',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.onSurface.withAlpha(180),
          ),
        ),
        const IText('John Doe'),
      ],
    ),
    actions: [
      IconButton(
        icon: const CircleAvatar(),
        onPressed: () {},
        color: AppColors.grey,
      ),
    ],
  );
}
