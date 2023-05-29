import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoDialogPanel extends StatelessWidget {
  final screenSize;

  const AddPhotoDialogPanel({super.key, required this.screenSize});

  // const AddPhotoDialogPanel(this.screenSize, {super.key})

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(0),
      shadowColor: INVISIBLE,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: screenSize,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.fromBorderSide(
                BorderSide(
                  color: DEFAULT_SUBTITLE_COLOR,
                ),
              ),
              // color: DEFAULT_SUBTITLE_COLOR,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: const Text(
                    'Выбрать из галереи',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                Container(
                  transformAlignment: Alignment.center,
                  alignment: Alignment.center,
                  height: 50,
                  child: const Text(
                    'Сделать фото',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.fromBorderSide(
                BorderSide(
                  color: DEFAULT_SUBTITLE_COLOR,
                ),
              ),
            ),
            child: const SizedBox(
              height: 44,
              child: Center(
                child: Text(
                  'Отмена',
                  style: TextStyle(
                    color: DEFAULT_ACCENT_COLOR,
                    fontFamily: 'SF Pro Display',
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPhotoPanel extends StatelessWidget {
  const AddPhotoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Выбрать из галереи',
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),

          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Сделать фото',
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 21,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text('Label $index'),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ModalBottomSheetDemo extends StatelessWidget {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return const SafeArea(
          left: true,
          right: true,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AddPhotoPanel(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showBottomSheet(context);
        },
        child: const Text('Open Modal panel'),
      ),
    );
  }
}

// Future<void> uploadPhoto(ImageSource source) async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedImage != null) {
//     final imageFile = File(pickedImage.path);
//     // Image picked successfully, do something with the image
//     // For example, you can upload it to a server or display it in your UI
//     // using a widget like Image.file or Image.memory.
//   } else {
//     // User canceled the image picking
//   }
// }
