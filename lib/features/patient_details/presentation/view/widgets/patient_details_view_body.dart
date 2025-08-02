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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _PatientDetailsViewBodyState extends State<PatientDetailsViewBody> {
  int _index = 0;

  @override
  Widget build(final BuildContext context) {
    const labels = ['Notes', 'Rays', 'Appointments'];
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
          ],
        ),
        const Divider(),
      ],
    );
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: [
          const PatientDetailsAppBar(),
          SliverToBoxAdapter(
            child: PersonalPatientDetails(patient: widget.patient),
          ),
          SliverToBoxAdapter(child: middleAppBar),
          SliverToBoxAdapter(
            child: PatientTabsViewBody(index: _index, patient: widget.patient),
          ),
        ],
      ),
    );
  }
}
