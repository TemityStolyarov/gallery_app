import 'package:flutter/material.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/global_widgets/snack_message.dart';

class GAppBar extends StatelessWidget {
  final Search search;
  final Widget? child;

  const GAppBar({
    required this.search,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: AppBar(
        elevation: 0,
        backgroundColor: DEFAULT_BACKGROUND_COLOR,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: GRAY_LIGHT),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: DEFAULT_SUBTITLE_COLOR),
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  onChanged: (_) => {/*TODO search functions*/},
                  onTapOutside: (event) {},
                  cursorColor: DEFAULT_ACCENT_COLOR,
                ),
              ),
              IconButton(
                splashColor: INVISIBLE,
                highlightColor: INVISIBLE,
                icon: const Icon(
                  Icons.search_sharp,
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
      ),
    );
  }

  //@override
  //Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void changeText(String value) {
  //TODO
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

// проблемы с шириной
// AppBar(
//       elevation: 0,
//       toolbarHeight: 500,
//       leading: Expanded(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             border: Border.all(color: Colors.grey),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     hintText: 'Search',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                   ),
//                   onChanged: (_) => {/*TODO*/},
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(
//                   Icons.search,
//                   color: DEFAULT_ACCENT_COLOR,
//                 ),
//                 onPressed: () {
//                   if (!search.isOpen) {
//                     search.open(context);
//                   } else {
//                     search.close(context, '');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       actions: [],
//     );