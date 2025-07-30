import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/extensions/string_extension.dart';
import 'core/helpers/app_media_query.dart';
import 'core/helpers/get_user.dart' show getUser;
import 'core/helpers/on_generate_routes.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utls/themes/app_colors.dart';
import 'core/utls/themes/app_text_style.dart';
import 'core/utls/themes/theme_config.dart';
import 'features/home/presentation/controllers/theme_mode_cubit/theme_mode_cubit.dart';
import 'features/main/presentation/views/main_view.dart' show MainView;
import 'features/onboarding/presentation/views/onboarding_view.dart';

class InsightMed extends StatelessWidget {
  const InsightMed({super.key});

  @override
  Widget build(final BuildContext context) => ScreenUtilInit(
    designSize: const Size(360, 800),
    minTextAdapt: true,
    splitScreenMode: true,
    child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
      builder: (final context, final state) => MaterialApp(
        initialRoute: (getUser?.token?.isNotEmpty ?? false)
            ? MainView.routeName
            : OnboardingView.routeName,
        onGenerateRoute: onGenerateRoute,
        theme: const ThemeConfig().light,
        darkTheme: const ThemeConfig().dark,
        themeMode:
            SharedPreferencesSingleton.getString(
              'themeMode',
            )?.toEnum(ThemeMode.values) ??
            ThemeMode.system,
        debugShowCheckedModeBanner: false,
        builder: (final context, final child) {
          AppColors.init(context);
          AppTextStyles.init(context);
          AppMediaQuery.init(context);
          return child!;
        },
      ),
    ),
    builder: (final context, final child) => child!,
  );
}
