import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show FloatingActionButton, Icon, Icons, Scaffold, State, StatefulWidget;

import '../../../patient_rays_ubmission/presentation/views/upload_medical_ray_view.dart';
import 'widgets/main_navigation_bar.dart' show MainNavigationBar;
import 'widgets/main_view_body.dart' show MainViewBody;

final class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

final class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  @override
  Scaffold build(_) => Scaffold(
    body: MainViewBody(selectedIndex: _selectedIndex),
    bottomNavigationBar: MainNavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (final index) =>
          setState(() => _selectedIndex = index),
    ),
    floatingActionButton: _selectedIndex == 0
        ? FloatingActionButton(
            tooltip: 'Upload Medical Ray',

            onPressed: () async {
              await Navigator.pushNamed(
                context,
                UploadMedicalRayView.routeName,
              );
            },
            child: const Icon(Icons.add_rounded),
          )
        : null,
  );
}
