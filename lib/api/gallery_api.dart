import 'package:dio/dio.dart';
import 'package:gallery_app/api/image_model.dart';

class GalleryApi {
  static final Dio dio = Dio(
      // BaseOptions(
      //   baseUrl: '',
      // ),
      );

  Future<List<ImageModel>> getImages() async {
    try {
      final response =
          await dio.get('https://gallery.prod1.webant.ru/api/photos');
      if (response.statusCode == 200) {
        final jsonList = response.data;
        final List<ImageModel> images =
            jsonList.map((json) => ImageModel.fromJson(json)).toList();
        return images;
      } else {
        print('Error, status code: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      throw Exception('$error');
    }
  }
}
