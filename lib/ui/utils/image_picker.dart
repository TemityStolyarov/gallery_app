import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<Widget> uploadPhoto() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    return const Text('An image has been succesfully loaded!');
    // Image picked successfully, do something with the image
    // For example, you can upload it to a server or display it in your UI
    // using a widget like Image.file or Image.memory.
  } else {
    return const Text('Image loading has beed cancelled!');
    // User canceled the image picking
  }
}
