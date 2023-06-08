import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';

class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/on_error.png',
          width: 130,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Oh shucks!',
            style: TextStyle(
              color: defaultTitleColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Slow or no internet connection.',
            style: TextStyle(
              color: defaultSubtitleColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Please check your internet settings',
            style: TextStyle(
              color: defaultSubtitleColor,
            ),
          ),
        ),
      ],
    );
  }
}
