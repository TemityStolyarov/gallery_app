import 'package:flutter/material.dart';
import 'package:gallery_app/routes/name_routes.dart';
import 'package:gallery_app/ui/pages/account_page/account_page.dart';
import 'package:gallery_app/ui/pages/feed_page/feed_page.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NameRoutes.feed:
        return MaterialPageRoute(
          builder: (_) => const FeedPage(),
        );
      case NameRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const AccountPage(),
        );
      default: //switch to error route in prod
        debugPrint('AppRouter: Page ${routeSettings.name} not found');
        return MaterialPageRoute(
          builder: (_) => const Text('Error'),
        );
    }
  }
}
