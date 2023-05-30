import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/routes/app_routes.dart';
import 'package:gallery_app/ui/global_widgets/appbar.dart';
import 'package:gallery_app/ui/global_widgets/tabbar.dart';
import 'package:gallery_app/ui/pages/utils/add_photo_panel.dart';
// import 'package:gallery_app/ui/utils/image_picker.dart';

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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // if (index == 1) {
    //   showDialog<String>(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //       title: const Text('AlertDialog Title'),
    //       content: const Text('AlertDialog description'),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () => Navigator.pop(context, 'Cancel'),
    //           child: const Text('Cancel'),
    //         ),
    //         TextButton(
    //           onPressed: () => Navigator.pop(context, 'OK'),
    //           child: const Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: DEFAULT_BACKGROUND_COLOR,
        fontFamily: 'SF Pro Display',
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: GAppBar(
            search: _search,
          ),
        ),
        body: _selectPage(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: DEFAULT_BACKGROUND_COLOR,
          //fixedColor: DEFAULT_ACCENT_COLOR,
          items: _getBottomNavigationBar(),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: DEFAULT_ACCENT_COLOR,
          unselectedItemColor: DEFAULT_SUBTITLE_COLOR,
          unselectedFontSize: 14,
        ),
      ),
      debugShowCheckedModeBanner: false,
      color: DEFAULT_ACCENT_COLOR,
    );
  }

  Widget _selectPage(int index) {
    final screenSize = MediaQuery.of(context).size.width;
    switch (index) {
      case 0:
        return const GTabBar();
      case 1:
        // Navigator.of(context).push(PageRouteBuilder(
        //     opaque: false,
        //     pageBuilder: (BuildContext context, _, __) {
        //       return ModalBottomSheetDemo();
        //     }));
        // return Container();
        // showDialog<String>(
        //   context: context,
        //   builder: (BuildContext context) => AlertDialog(
        //     title: const Text('AlertDialog Title'),
        //     content: const Text('AlertDialog description'),
        //     actions: <Widget>[
        //       TextButton(
        //         onPressed: () => Navigator.pop(context, 'Cancel'),
        //         child: const Text('Cancel'),
        //       ),
        //       TextButton(
        //         onPressed: () => Navigator.pop(context, 'OK'),
        //         child: const Text('OK'),
        //       ),
        //     ],
        //   ),
        // );
        // return Container(
        //   child: Text('Noob'),
        // );

        return AddPhotoDialogPanel(screenSize: screenSize);
      case 2:
        return const Text('An account page');
      default:
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'An error occured while loading main page with BottomNavigationBar!',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }

  _getBottomNavigationBar() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Feed',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.camera_alt_outlined,
        ),
        label: 'Add photo',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
        ),
        label: 'Profile',
      ),
    ];
  }
}
