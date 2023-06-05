import 'package:flutter/material.dart';
import 'package:gallery_app/api/image_model.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/widgets/add_photo_panel.dart';
import 'package:intl/intl.dart';

class ImageDetailPage extends StatefulWidget {
  final ImageModel image;
  final String username;
  const ImageDetailPage(this.image, {super.key, required this.username});

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

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
    DateTime dateTime = DateTime.parse(widget.image.dateCreate);
    String convertedDateTime =
        '${dateTime.day.toString().padLeft(2, '0')} ${DateFormat.MMM().format(dateTime).toLowerCase()}. ${dateTime.year.toString()}';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        title: const Text(''),
        backgroundColor: DEFAULT_BACKGROUND_COLOR,
        iconTheme: const IconThemeData(
          color: DEFAULT_TITLE_COLOR,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://gallery.prod1.webant.ru/media/${widget.image.image.name}',
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      widget.image.name.isNotEmpty
                          ? widget.image.name
                          : 'Untitled',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: DEFAULT_TITLE_COLOR,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      widget.username,
                      style: const TextStyle(
                        fontSize: 15,
                        color: DEFAULT_ACCENT_COLOR,
                      ),
                    ),
                  ),
                  Text(
                    widget.image.description.isNotEmpty
                        ? widget.image.description
                        : 'No description',
                  ),
                  // Tags
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        widget.image.isNew
                            ? Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  color: DEFAULT_ACCENT_COLOR,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                      color: DEFAULT_BACKGROUND_COLOR,
                                    ),
                                  ),
                                ),
                              )
                            : const Text(''),
                        widget.image.isPopular
                            ? Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  color: DEFAULT_ACCENT_COLOR,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Popular',
                                    style: TextStyle(
                                      color: DEFAULT_BACKGROUND_COLOR,
                                    ),
                                  ),
                                ),
                              )
                            : const Text(''),
                      ],
                    ),
                  ),
                  Text(
                    convertedDateTime,
                    style: const TextStyle(
                      color: DEFAULT_SUBTITLE_COLOR,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Views: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '999+',
                          style: TextStyle(
                            color: DEFAULT_SUBTITLE_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
