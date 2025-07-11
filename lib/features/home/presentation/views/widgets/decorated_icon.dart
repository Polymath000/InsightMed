import 'package:flutter/widgets.dart'
    show
        Color,
        DecoratedBox,
        Icon,
        IconData,
        RoundedRectangleBorder,
        ShapeDecoration,
        SizedBox,
        StatelessWidget;

import '../../../../../core/constants/borders.dart' show AppBorders;

final class DecoratedIcon extends StatelessWidget {
  const DecoratedIcon({required this.color, required this.icon, super.key});

  final Color color;
  final IconData icon;

  @override
  DecoratedBox build(_) => DecoratedBox(
    decoration: ShapeDecoration(
      color: color.withAlpha(50),
      shape: const RoundedRectangleBorder(borderRadius: AppBorders.xxl),
    ),
    child: SizedBox(width: 32, height: 40, child: Icon(icon, color: color)),
  );
}
