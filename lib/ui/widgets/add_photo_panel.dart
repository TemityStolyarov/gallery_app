import 'package:flutter/material.dart';
import 'package:gallery_app/core/constants.dart';

class AddPhotoDialogPanel extends StatelessWidget {
  const AddPhotoDialogPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(0),
      shadowColor: INVISIBLE,
      backgroundColor: INVISIBLE,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: screenSize,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: DEFAULT_BACKGROUND_COLOR,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: const Text(
                    'Выбрать из галереи',
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
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: DEFAULT_BACKGROUND_COLOR,
              ),
              child: const SizedBox(
                height: 44,
                child: Center(
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                      color: DEFAULT_ACCENT_COLOR,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
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
