import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: const HomeViewBody(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add_rounded),
    ),
  );
}
