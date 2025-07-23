import 'package:flutter/material.dart';
import '../../../../appts/presentation/view/appts_view.dart';
import '../../../../notes/presentation/view/notes_view.dart';
import '../../../../rays/presentation/view/rays_view.dart';
import 'appts_view.dart';

class PatientTabsViewBody extends StatelessWidget {
  const PatientTabsViewBody({required this.index, super.key});
  final int index;

  @override
  Widget build(final BuildContext context) {
    final List<Widget> pages = [
      const NotesView(),
      const RaysView(),
      const ApptsView(),
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
