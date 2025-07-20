import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  const CustomLinearPercentIndicator({
    super.key,
    required this.percent,
    required this.color,
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
    width: MediaQuery.of(context).size.width - 150,
    padding: EdgeInsets.zero,
    animateFromLastPercent: true,
  );
}
