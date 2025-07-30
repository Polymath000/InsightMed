import 'package:flutter/material.dart';
import '../../../../../core/entities/user_entity.dart';
import '../../../../appts/presentation/view/appts_view.dart';
import '../../../../notes/presentation/view/notes_view.dart';
import '../../../../rays/presentation/view/rays_view.dart';

class PatientTabsViewBody extends StatelessWidget {
  const PatientTabsViewBody({
    required this.patient,
    required this.index,
    super.key,
  });
  final int index;
  final UserEntity patient;

  @override
  Widget build(final BuildContext context) {
    final pages = <Widget>[
      NotesView(patientId: patient.id!),
      RaysView(patient: patient),
      ApptsView(email: patient.email ?? ''),
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (final child, final animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: Container(key: ValueKey<int>(index), child: pages[index]),
    );
  }
}
