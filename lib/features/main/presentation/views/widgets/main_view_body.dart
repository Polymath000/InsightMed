import 'package:flutter/material.dart';
import '../../../../appointments/presentation/views/appointments_view.dart'
    show AppointmentsView;
import '../../../../home/presentation/views/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({this.selectedIndex = 0, super.key});
  final int selectedIndex;

  @override
  Widget build(final BuildContext context) =>
      const [HomeView(), AppointmentsView(), HomeView()][selectedIndex];
}
