import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String details = '/details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
      case details:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
    }
  }
}
