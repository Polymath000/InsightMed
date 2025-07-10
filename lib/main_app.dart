import 'package:flutter/material.dart';
import 'core/helpers/app_media_query.dart';
import 'core/helpers/on_generate_routes.dart';
import 'core/utls/themes/app_colors.dart';
import 'core/utls/themes/app_text_style.dart';
import 'core/utls/themes/theme_config.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

class InsightMed extends StatelessWidget {
  const InsightMed({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
    initialRoute: OnboardingView.routeName,
    onGenerateRoute: onGenerateRoute,
    theme: const ThemeConfig().light,
    darkTheme: const ThemeConfig().dark,
    debugShowCheckedModeBanner: false,
    builder: (final context, final child) {
      AppColors.init(context);
      AppTextStyles.init(context);
      AppMediaQuery.init(context);
      return child!;
    },
  );
}
