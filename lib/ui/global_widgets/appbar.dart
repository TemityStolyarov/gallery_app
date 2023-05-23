import 'package:flutter/material.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/global_widgets/snack_message.dart';

class GalleryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Search search;
  final Widget? child;

  const GalleryAppBar({
    required this.search,
    this.child,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: DEFAULT_BACKGROUND_COLOR,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  onChanged: (_) => {/*TODO*/},
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: DEFAULT_ACCENT_COLOR,
                ),
                onPressed: () {
                  if (!search.isOpen) {
                    search.open(context);
                  } else {
                    search.close(context, '');
                  }
                },
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  void changeText(String value) {
    //TODO
  }
}

class Search {
  String selectedText;
  bool isOpen;

  Search({
    required this.selectedText,
    required this.isOpen,
  });

  void open(BuildContext context) {
    showSnackMessage(context, '\'Search\' is pressed');
    isOpen = true;
  }

  void close(BuildContext context, String selectedText) {
    showSnackMessage(context, 'Searching $selectedText');
    isOpen = false;
  }
}
