import 'package:flutter/material.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/global_widgets/appbar.dart';
import 'package:gallery_app/ui/pages/gpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Search _search = Search(
    isOpen: false,
    selectedText: 'Empty',
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: DEFAULT_BACKGROUND_COLOR,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: GAppBar(
            search: _search,
          ),
        ),
        body: const Column(
          children: [
            //NewPage(),
            //PopularPage(),
            GPage(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      color: DEFAULT_ACCENT_COLOR,
    );
  }
}
