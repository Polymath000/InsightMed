import 'package:flutter/material.dart';

import '../../../../../core/entities/user_entity.dart';
import 'patient_details_app_bar.dart';
import 'patient_tabs_view_body.dart';
import 'personal_patient_details.dart';

class PatientDetailsViewBody extends StatefulWidget {
  const PatientDetailsViewBody({required this.patient, super.key});
  final UserEntity patient;

  @override
  State<PatientDetailsViewBody> createState() => _PatientDetailsViewBodyState();
}

class _PatientDetailsViewBodyState extends State<PatientDetailsViewBody> {
  int _index = 0;

  @override
  Widget build(final BuildContext context) {
    const labels = ['Notes', 'Rays', 'Appts'];
    final middleAppBar = Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...labels.map((final label) {
              final labelIndex = labels.indexOf(label);
              return ChoiceChip(
                label: Text(label),
                selected: _index == labelIndex,
                onSelected: (_) => setState(() => _index = labelIndex),
              );
            }),

            // ...labels.map((final label) {
            //   final labelIndex = labels.indexOf(label);
            //   return GestureContainer(
            //     index: index,
            //     bIndex: labelIndex,
            //     title: label,
            //     onSelected: (final value) {
            //       setState(() {
            //         index = value;
            //       });
            //     },
            //   );
            // }),
          ],
        ),
        const Divider(),
      ],
    );
    return CustomScrollView(
      slivers: [
        const PatientDetailsAppBar(),
        SliverToBoxAdapter(
          child: PersonalPatientDetails(patient: widget.patient),
        ),
        SliverToBoxAdapter(child: middleAppBar),
        SliverToBoxAdapter(child: PatientTabsViewBody(index: _index)),
      ],
    );
  }
}
