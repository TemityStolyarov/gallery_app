import 'package:flutter/material.dart';
import 'package:gallery_app/routes/name_routes.dart';
import 'package:gallery_app/ui/global_widgets/tabbar.dart';
import 'package:gallery_app/ui/pages/utils/add_photo_panel.dart';
// import 'package:testzone/features/auth/screens/login_screen.dart';
// import 'package:testzone/features/home/home_page.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case NameRoutes.feed:
      //   return MaterialPageRoute(
      //     builder: (_) => const GTabBar(),
      //   );
      case NameRoutes.addPhoto:
        return MaterialPageRoute(
          builder: (_) => ModalBottomSheetDemo(),
        );

      default:
        debugPrint('AppRouter: Page ${routeSettings.name} not found');
        return MaterialPageRoute(
          builder: (_) => ModalBottomSheetDemo(),
        );
    }
  }
}
