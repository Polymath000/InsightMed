import 'package:flutter/material.dart'
    show
        Icon,
        Icons,
        NavigationBar,
        NavigationDestination,
        StatelessWidget,
        ValueChanged;

import '../../../../../core/helpers/get_user.dart';

final class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    this.selectedIndex = 0,
    this.onDestinationSelected,
    super.key,
  });
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  @override
  NavigationBar build(_) => NavigationBar(
    selectedIndex: selectedIndex,
    onDestinationSelected: onDestinationSelected,
    destinations: [
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
        selectedIcon: Icon(Icons.home_rounded),
      ),
      if (getUser?.isPatient() ?? false)
        const NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Appointments',
          selectedIcon: Icon(Icons.calendar_month_rounded),
        ),
      const NavigationDestination(
        icon: Icon(Icons.person_outline_rounded),
        label: 'Profile',
        selectedIcon: Icon(Icons.person_rounded),
      ),
    ],
  );
}
