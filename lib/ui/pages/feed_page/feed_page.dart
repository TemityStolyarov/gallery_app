import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/global_widgets/appbar.dart';
import 'package:gallery_app/ui/global_widgets/tabbar.dart';
import 'package:gallery_app/ui/pages/utils/add_photo_panel.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final Search _search = Search(
    isOpen: false,
    selectedText: 'Empty',
  );

  int _selectedIndex = 0;

  void onItemTapped(int index) async {
    if (index == 1) {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => const AddPhotoDialogPanel(),
      );
      index = _selectedIndex;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: GAppBar(
          search: _search,
        ),
      ),
      body: const GTabBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DEFAULT_BACKGROUND_COLOR,
        items: _getBottomNavigationBar(),
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: DEFAULT_ACCENT_COLOR,
        unselectedItemColor: DEFAULT_SUBTITLE_COLOR,
        unselectedFontSize: 14,
      ),
    );
  }

  _getBottomNavigationBar() {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Feed',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.camera_alt_outlined,
        ),
        label: 'Add photo',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
        ),
        label: 'Profile',
      ),
    ];
  }
}
