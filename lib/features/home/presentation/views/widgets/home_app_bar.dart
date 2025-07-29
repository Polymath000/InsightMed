import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        CrossAxisAlignment,
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
  SliverAppBar build(final BuildContext context) {
    final dayTime = switch (DateTime.now().hour) {
      < 12 => 'Good morning,',
      < 18 => 'Good afternoon,',
      _ => 'Good evening,',
    };

    return SliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IText(
            dayTime,
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
    );
  }
}
