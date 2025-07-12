import 'package:flutter/widgets.dart' show StatelessWidget;

import 'widgets/home_view_body.dart' show HomeViewBody;

final class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  HomeViewBody build(_) => const HomeViewBody();
}
