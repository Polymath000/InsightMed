import 'package:flutter/material.dart';

import 'widgets/main_navigation_bar.dart';
import 'widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  @override
  Widget build(final BuildContext context) => Scaffold(
    body: MainViewBody(selectedIndex: _selectedIndex),
    bottomNavigationBar: MainNavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (final index) =>
          setState(() => _selectedIndex = index),
    ),
  );
}
