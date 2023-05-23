import 'package:flutter/material.dart';

void showSnackMessage(
  BuildContext context,
  String text, {
  Duration duration = const Duration(seconds: 1),
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration,
      content: Text(text),
      action: SnackBarAction(
        label: "ОК",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("ОК"),
            ),
          );
        },
      ),
    ),
  );
}
