import 'package:flutter/widgets.dart' show StatelessWidget, Widget;

import '../../../../appointments/presentation/views/appointments_view.dart'
    show AppointmentsView;
import '../../../../home_patient_view/presentation/views/home_view.dart'
    show HomeView;
import '../../../../pofile_view/profile_view.dart';

final class MainViewBody extends StatelessWidget {
  const MainViewBody({this.selectedIndex = 0, super.key});
  final int selectedIndex;

  @override
  Widget build(_) =>
      const [HomeView(), AppointmentsView(), ProfileView()][selectedIndex];
}
