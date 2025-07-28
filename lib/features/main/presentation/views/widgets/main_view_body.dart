import 'package:flutter/widgets.dart' show StatelessWidget, Widget;

import '../../../../../core/helpers/get_user.dart';
import '../../../../appointments/presentation/views/appointments_view.dart'
    show AppointmentsView;
import '../../../../home/presentation/views/home_view.dart' show HomeView;
import '../../../../pofile/presentation/views/profile_view.dart';

final class MainViewBody extends StatelessWidget {
  const MainViewBody({this.selectedIndex = 0, super.key});
  final int selectedIndex;

  @override
  Widget build(_) => [
    const HomeView(),
    if (getUser?.isPatient() ?? false) const AppointmentsView(),
    const ProfileView(),
  ][selectedIndex];
}
