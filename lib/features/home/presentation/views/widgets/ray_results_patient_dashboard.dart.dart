import 'package:flutter/material.dart';

import '../../../../../core/entities/ray_entity.dart';
import '../../../../rays/presentation/view/widget/ray_card.dart';

class RayResultsPatientDashboard extends StatelessWidget {
  RayResultsPatientDashboard({required this.rays, super.key});
  List<RayEntity> rays;
  static const String routeName = 'rayResultsPatientDashboard';
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Rays')),
    body: rays.isEmpty
        ? const Center(child: Text('No rays found'))
        : ListView.builder(
            itemCount: rays.length,
            itemBuilder: (final context, final index) =>
                RayCard(ray: rays[index], index: index + 1),
          ),

    // return const Center(child: Text('No rays found'));
  );
}
