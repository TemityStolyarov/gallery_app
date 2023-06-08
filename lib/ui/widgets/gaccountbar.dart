import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';

class GAccountBar extends StatelessWidget {
  const GAccountBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      elevation: 1,
      backgroundColor: defaultBackgroundColor,
      title: const Column(
        children: [
          Text(
            'Profile',
            style: TextStyle(
              color: defaultTitleColor,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            splashColor: invisible,
            highlightColor: invisible,
            icon: const Icon(
              Icons.settings_outlined,
              color: defaultAccentColor,
              size: 28,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
