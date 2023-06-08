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
      shadowColor: invisible,
      backgroundColor: invisible,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: screenSize,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: defaultBackgroundColor,
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
                color: defaultBackgroundColor,
              ),
              child: const SizedBox(
                height: 44,
                child: Center(
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                      color: defaultAccentColor,
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
