import 'package:flutter/material.dart'
    show
        Brightness,
        BuildContext,
        Column,
        CrossAxisAlignment,
        Icon,
        IconButton,
        Icons,
        MainAxisSize,
        SliverAppBar,
        StatelessWidget,
        TextStyle,
        Theme;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;
import '../../controllers/theme_mode_cubit/theme_mode_cubit.dart';

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
      actions: [
        IconButton(
          icon: Theme.of(context).brightness == Brightness.light
              ? const Icon(Icons.dark_mode_rounded)
              : const Icon(Icons.light_mode_rounded),
          onPressed: () =>
              context.read<ThemeModeCubit>().changeThemeMode(context),
        ),
      ],
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
