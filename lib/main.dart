import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: DEFAULT_BACKGROUND_COLOR,
        fontFamily: 'SF Pro Display',
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      color: DEFAULT_ACCENT_COLOR,
    );
  }
}
