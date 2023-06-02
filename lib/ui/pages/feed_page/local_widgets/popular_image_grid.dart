import 'package:flutter/material.dart';
import 'package:gallery_app/api/gallery_api.dart';
import 'package:gallery_app/api/image_model.dart';

class PopularImageGridScreen extends StatefulWidget {
  const PopularImageGridScreen({super.key});

  @override
  createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<PopularImageGridScreen> {
  final GalleryApi _galleryApi = GalleryApi();
  late Future<List<ImageModel>> _imagesFuture;

  @override
  void initState() {
    super.initState();
    _imagesFuture = _galleryApi.getPopularImages();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: _imagesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<ImageModel> images = snapshot.data!;
          final screenHeight = MediaQuery.of(context).size.height - 258;
          return SizedBox(
            height: screenHeight,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 150 / 100,
                ),
                itemCount: images.length,
                clipBehavior: Clip.hardEdge,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      'https://gallery.prod1.webant.ru/media/${images[index].image.name}',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
