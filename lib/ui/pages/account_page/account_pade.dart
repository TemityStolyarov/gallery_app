import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/widgets/add_photo_panel.dart';
import 'package:gallery_app/ui/widgets/gaccountbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 2;

  void onItemTapped(int index) async {
    if (index == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
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
        preferredSize: Size.fromHeight(65.0),
        child: GAccountBar(),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'An account page',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
