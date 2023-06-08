import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/widgets/gappbar.dart';
import 'package:gallery_app/ui/widgets/gtabbar.dart';
import 'package:gallery_app/ui/widgets/add_photo_panel.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _selectedIndex = 0;

  void onItemTapped(int index) async {
    if (index == 2) {
      Navigator.of(context).pushNamed('/profile');
    }
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
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: GAppBar(),
      ),
      body: const GTabBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: defaultBackgroundColor,
        items: _getBottomNavigationBar(),
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: defaultAccentColor,
        unselectedItemColor: defaultSubtitleColor,
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
