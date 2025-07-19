import 'package:flutter/material.dart';
import 'package:swift_checkin/features/auth/presentation/pages/login_page.dart';
import 'package:swift_checkin/features/home/presentation/pages/home_page.dart';

/// Centralized class for defining app route names and their corresponding widget builders.
/// This approach improves maintainability and discoverability of available routes.
class AppRoutes {
  // Route name constants
  static const String login = '/login';
  static const String home = '/home';

  /// Returns a map of route names to their widget builders.
  static Map<String, WidgetBuilder> get routes => {
        login: (context) => const LoginPage(),
        home: (context) => const HomePage(),
      };
}
