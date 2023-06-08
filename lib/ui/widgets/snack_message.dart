import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';

void showSnackMessage(
  BuildContext context,
  String text, {
  Duration duration = const Duration(seconds: 1),
  required bool showActionButton,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: defaultTitleColor,
      duration: duration,
      content: Text(text),
      action: showActionButton
          ? SnackBarAction(
              label: "ОК",
              textColor: grayLight,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: defaultTitleColor,
                    content: Text("You have pressed 'ОК' button"),
                  ),
                );
              },
            )
          : null,
    ),
  );
}
