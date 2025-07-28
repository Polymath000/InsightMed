import 'package:flutter/material.dart';
import '../../../../core/entities/user_entity.dart';
import 'widget/ray_card.dart';

class RaysView extends StatelessWidget {
  const RaysView({required this.patient, super.key});
  final UserEntity patient;

  @override
  Widget build(final BuildContext context) => Column(
    children:
        patient.rays
            ?.map(
              (final ray) =>
                  RayCard(ray: ray, index: patient.rays!.indexOf(ray) + 1),
            )
            .toList() ??
        [],
  );
}
