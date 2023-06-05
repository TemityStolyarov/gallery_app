import 'package:dio/dio.dart';
import 'package:gallery_app/api/image_model.dart';

import 'package:http/http.dart' as http;

class GalleryApi {
  static final dio = Dio();

  Future<List<ImageModel>> getNewImages() async {
    final response =
        await dio.get('https://gallery.prod1.webant.ru/api/photos');
    if (response.statusCode == 200) {
      final jsonList = response.data;
      final images = List<ImageModel>.from(
          jsonList['data'].map((json) => ImageModel.fromJson(json)));

      final filteredImages = await filterNewImages(images);
      return filteredImages;
    } else {
      throw Exception('Error, status code: ${response.statusCode}');
    }
  }

  Future<List<ImageModel>> filterNewImages(List<ImageModel> images) async {
    final filteredImages = <ImageModel>[];
    for (final image in images) {
      // http.Response response = await http.get(
      //   Uri.parse('https://gallery.prod1.webant.ru/media/${image.image.name}'),
      // );
      // if (response.statusCode == 200) {
      if (image.isNew) {
        filteredImages.add(image);
      }
      // }
    }
    return filteredImages;
  }

  Future<List<ImageModel>> getPopularImages() async {
    final response =
        await dio.get('https://gallery.prod1.webant.ru/api/photos');
    if (response.statusCode == 200) {
      final jsonList = response.data;
      final images = List<ImageModel>.from(
          jsonList['data'].map((json) => ImageModel.fromJson(json)));

      final filteredImages = await filterPopularImages(images);
      return filteredImages;
    } else {
      throw Exception('Error, status code: ${response.statusCode}');
    }
  }

  Future<List<ImageModel>> filterPopularImages(List<ImageModel> images) async {
    final filteredImages = <ImageModel>[];
    for (final image in images) {
      // http.Response response = await http.get(
      //   Uri.parse('https://gallery.prod1.webant.ru/media/${image.image.name}'),
      // );
      // if (response.statusCode == 200) {
      if (image.isPopular) {
        filteredImages.add(image);
      }
      // }
    }
    return filteredImages;
  }
}
