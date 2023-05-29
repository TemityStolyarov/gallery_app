import 'package:flutter/material.dart';
import 'package:gallery_app/ui/pages/feed_widgets/image_api.dart';
import 'package:gallery_app/ui/pages/feed_widgets/image_model.dart';

class ImageGridScreen extends StatefulWidget {
  const ImageGridScreen({super.key});

  @override
  createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<ImageGridScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<ImageModel>> _imagesFuture;

  @override
  void initState() {
    super.initState();
    _imagesFuture = _apiService.getImages();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: _imagesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<ImageModel> images = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Два элемента в ряду
              mainAxisSpacing: 8.0, // Расстояние между рядами
              crossAxisSpacing: 8.0, // Расстояние между элементами в ряду
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              final ImageModel image = images[index];
              return Image.network(image.image
                  .name); // Замените на вашу логику отображения изображения
            },
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
