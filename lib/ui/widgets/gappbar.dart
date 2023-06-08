import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/widgets/snack_message.dart';

class GAppBar extends StatelessWidget {
  final Widget? child;

  const GAppBar({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: AppBar(
        elevation: 0,
        backgroundColor: defaultBackgroundColor,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: grayLight),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: defaultSubtitleColor,
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  onChanged: (text) => {
                    searchingText = text,
                  },
                  cursorColor: defaultAccentColor,
                ),
              ),
              IconButton(
                splashColor: invisible,
                highlightColor: invisible,
                icon: const Icon(
                  Icons.search_sharp,
                  color: defaultAccentColor,
                ),
                onPressed: () {
                  if (searchingText.isEmpty) {
                    showSnackMessage(
                      context,
                      '\'Search\' is pressed',
                      showActionButton: true,
                    );
                  } else {
                    showSnackMessage(
                      context,
                      'Searching $searchingText',
                      showActionButton: true,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String searchingText = '';
