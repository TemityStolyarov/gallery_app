import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/api/image_model.dart';

import 'package:http/http.dart' as http;

class GalleryApi {
  static final dio = Dio();

  Future<List<ImageModel>> getImages() async {
    // List<ImageModel> filteredImages = [];
    final response =
        await dio.get('https://gallery.prod1.webant.ru/api/photos');
    if (response.statusCode == 200) {
      final jsonList = response.data;
      final images = List<ImageModel>.from(
          jsonList['data'].map((json) => ImageModel.fromJson(json)));

      final filteredImages = await filterImages(images);
      return filteredImages;
    } else {
      throw Exception('Error, status code: ${response.statusCode}');
    }
  }

  Future<List<ImageModel>> filterImages(List<ImageModel> images) async {
    final filteredImages = <ImageModel>[];
    for (final image in images) {
      http.Response response = await http.get(
        Uri.parse('https://gallery.prod1.webant.ru/media/${image.image.name}'),
      );
      if (response.statusCode == 200) {
        filteredImages.add(image);
      }
    }
    return filteredImages;
  }
}
