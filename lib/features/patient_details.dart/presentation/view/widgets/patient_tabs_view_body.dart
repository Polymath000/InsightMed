import 'package:flutter/material.dart';
import 'appts_view.dart';
import 'notes_view.dart';
import 'rays_view.dart';

class PatientTabsViewBody extends StatelessWidget {
  const PatientTabsViewBody({super.key, required this.index});
  final int index;
  @override
  Widget build(final BuildContext context) => [const NotesView(),const RaysView(), const ApptsView() ][index];
}
