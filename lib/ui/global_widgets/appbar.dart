import 'package:flutter/material.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/global_widgets/snack_message.dart';

class GalleryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String selectedText;
  final Search search;
  final Widget? child;

  const GalleryAppBar({
    required this.selectedText,
    required this.search,
    this.child,
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: DEFAULT_SUBTITLE_COLOR,
                    style: BorderStyle.solid,
                  )),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusColor: DEFAULT_ACCENT_COLOR,
                          hintText: 'Search',
                        ),
                        cursorColor: DEFAULT_ACCENT_COLOR,
                      ),
                    ),
                    //const SizedBox(width: 16),
                    Icon(
                      Icons.search,
                      color: DEFAULT_ACCENT_COLOR,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
    //   centerTitle: true,
    //   actions: [
    //     GestureDetector(
    //       onTap: () {
    //         if (!search.isOpen) {
    //           search.open(context);
    //         } else {
    //           search.close(context, selectedText);
    //         }
    //       },
    //       child: Padding(
    //         padding: const EdgeInsets.all(5),
    //         child: child,
    //       ),
    //     )
    //   ],
    // );
  }
}

class Search {
  final String selectedText;
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
