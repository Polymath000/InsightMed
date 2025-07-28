import 'package:flutter/material.dart'
    show
        BuildContext,
        CircleAvatar,
        Column,
        CrossAxisAlignment,
        IconButton,
        MainAxisSize,
        SliverAppBar,
        StatelessWidget,
        TextStyle;

import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;

final class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  SliverAppBar build(final BuildContext context) => SliverAppBar(
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
        if (getUser?.isDoctor() ?? false)
          IText('Dr. ${getUser?.name ?? 'Anonymous'}')
        else
          IText(getUser?.name ?? 'Anonymous'),
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
