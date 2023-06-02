import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';

void showSnackMessage(
  BuildContext context,
  String text, {
  Duration duration = const Duration(seconds: 1),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: DEFAULT_TITLE_COLOR,
      duration: duration,
      content: Text(text),
      action: SnackBarAction(
        label: "ОК",
        textColor: GRAY_LIGHT,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: DEFAULT_TITLE_COLOR,
              content: Text("You have pressed 'ОК' button"),
            ),
          );
        },
      ),
    ),
  );
}
