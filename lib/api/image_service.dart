import 'package:dio/dio.dart';
import 'package:gallery_app/core/image_model.dart';

class ImageService {
  final Dio _dio = Dio();

  Future<List<ImageModel>> getImages({
    required bool isNew,
    required bool isPopular,
    int page = 1,
  }) async {
    final response = await _dio.get(
        'https://gallery.prod1.webant.ru/api/photos?new=$isNew&popular=$isPopular&page=$page&limit=10');
    if (response.statusCode == 200) {
      final jsonList = response.data;
      final images = List<ImageModel>.from(
          jsonList['data'].map((json) => ImageModel.fromJson(json)));
      if (images.isEmpty) {
        return [];
      }
      return images;
    } else {
      throw Exception('Error, status code: ${response.statusCode}');
    }
  }
}
