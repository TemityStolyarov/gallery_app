import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: defaultAccentColor,
      ),
    );
  }
}
