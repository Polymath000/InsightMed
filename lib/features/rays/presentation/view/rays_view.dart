import 'package:flutter/material.dart';
import 'widget/ray_card.dart';

class RaysView extends StatelessWidget {
  const RaysView({super.key});

  @override
  Widget build(final BuildContext context) => const Padding(
    padding: EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 25),
    child: Column(
      children: [
        RayCard(),
        SizedBox(height: 16),
        RayCard(),
        SizedBox(height: 16),
        RayCard(),
      ],
    ),
  );
}
