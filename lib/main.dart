import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/global_widgets/appbar.dart';
import 'package:gallery_app/ui/pages/bloc/select_page_bloc.dart';
import 'package:gallery_app/ui/pages/new_page.dart';
import 'package:gallery_app/ui/pages/popular_page.dart';

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
        body: BlocProvider(
          create: (context) => SelectPageBloc(),
          child: BlocBuilder<SelectPageBloc, SelectPageState>(
            builder: (context, state) {
              if (state is SelectedNewPageState) {
                return BlocBuilder<SelectPageBloc, SelectPageState>(
                  builder: (context, state) {
                    return const Column(
                      children: [
                        NewPage(),
                      ],
                    );
                  },
                );
              }

              if (state is SelectedPopularPageState) {
                return BlocBuilder<SelectPageBloc, SelectPageState>(
                  builder: (context, state) {
                    return const Column(
                      children: [
                        PopularPage(),
                      ],
                    );
                  },
                );
              }
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Error #main'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: DEFAULT_BACKGROUND_COLOR,
          fixedColor: DEFAULT_ACCENT_COLOR,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: DEFAULT_ACCENT_COLOR,
              ),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: DEFAULT_SUBTITLE_COLOR,
              ),
              label: 'Add photo',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: DEFAULT_SUBTITLE_COLOR,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
      color: DEFAULT_ACCENT_COLOR,
    );
  }
}
