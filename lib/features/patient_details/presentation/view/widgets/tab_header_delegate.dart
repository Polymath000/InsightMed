import 'package:flutter/material.dart';

class TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  TabHeaderDelegate({required this.child});
  final Widget child;

  @override
  double get minExtent => 124;
  @override
  double get maxExtent => 124;

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) => child;

  @override
  bool shouldRebuild(final TabHeaderDelegate oldDelegate) => true;
}
