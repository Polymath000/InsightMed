import 'package:flutter/material.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import 'appts_view.dart';
import '../../../../notes/presentation/view/notes_view.dart';
import 'rays_view.dart';

class PatientTabsViewBody extends StatelessWidget {
  const PatientTabsViewBody({required this.index, super.key});
  final int index;
  @override
  Widget build(final BuildContext context) => ColoredBox(
    color: AppColors.transparent,
    child: [const NotesView(),const RaysView(), const ApptsView() ][index],
  );
}
