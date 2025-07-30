import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../../../../core/services/shared_preferences_singleton.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeInitial());

  Future<void> changeThemeMode(final BuildContext context) async {
    final brightness = Theme.of(context).brightness;
    final isLight = brightness == Brightness.light;
    await SharedPreferencesSingleton.setString(
      'themeMode',
      isLight ? ThemeMode.dark.name : ThemeMode.light.name,
    );
    if (isLight) {
      emit(const ThemeModeDark());
    } else {
      emit(const ThemeModeLight());
    }
  }
}
