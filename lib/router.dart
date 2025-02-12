import 'package:flutter_tab_bar_test/features/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

import 'models/types/tab_type.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: TabType.animation.name,
          builder: (context, state) =>
              HomeScreen(tabName: TabType.animation.name),
        ),
        GoRoute(
          path: TabType.bigImage.name,
          builder: (context, state) =>
              HomeScreen(tabName: TabType.bigImage.name),
        ),
        GoRoute(
          path: TabType.api.name,
          builder: (context, state) => HomeScreen(tabName: TabType.api.name),
        ),
      ],
    ),
  ],
);
