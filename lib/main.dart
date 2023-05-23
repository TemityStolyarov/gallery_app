import 'package:flutter/material.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/global_widgets/appbar.dart';

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
    selectedText: '',
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: GalleryAppBar(
          search: _search,
          selectedText: '',
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('context'),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      color: DEFAULT_ACCENT_COLOR,
    );
  }
}
