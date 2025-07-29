import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../helpers/app_media_query.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  const CustomLinearPercentIndicator({
    required this.percent,
    required this.color,
    super.key,
  });
  final double percent;
  final Color color;
  @override
  Widget build(final BuildContext context) => LinearPercentIndicator(
    progressColor: color,
    animation: true,
    lineHeight: 8,
    barRadius: const Radius.circular(16),
    percent: percent,
    width: AppMediaQuery.width - 150,
    padding: EdgeInsets.zero,
    animateFromLastPercent: true,
  );
}
