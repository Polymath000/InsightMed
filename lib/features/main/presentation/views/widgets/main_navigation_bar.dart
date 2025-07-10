import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    this.selectedIndex = 0,
    this.onDestinationSelected,
    super.key,
  });
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  @override
  Widget build(final BuildContext context) => NavigationBar(
    selectedIndex: selectedIndex,
    onDestinationSelected: onDestinationSelected,
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
      NavigationDestination(
        icon: Icon(Icons.calendar_month_rounded),
        label: 'Appointments',
      ),
      NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
    ],
  );
}
