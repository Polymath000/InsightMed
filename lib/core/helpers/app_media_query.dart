import 'dart:developer' show log;
import 'package:flutter/widgets.dart'
    show BuildContext, MediaQuery, Orientation, Size, immutable;

@immutable
sealed class AppMediaQuery {
  const AppMediaQuery();

  static late Size _size;
  static late Orientation _orientation;

  static void init(final BuildContext context) {
    _orientation = MediaQuery.orientationOf(context);
    _size = MediaQuery.sizeOf(context);
  }

  /// Orientation
  static bool get isPortrait => _orientation == Orientation.portrait;

  /// Size
  static double get width => _size.width;
  static double get height => _size.height;
  static double get shortestSide => _size.shortestSide;
  static double get longestSide => _size.longestSide;

  static void get print => log(
    'orientation: $_orientation\n'
    'width: $width\n'
    'height: $height\n'
    'shortestSide: $shortestSide\n'
    'longestSide: $longestSide\n',
  );
}
