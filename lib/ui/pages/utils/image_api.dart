import 'package:dio/dio.dart';
import 'package:gallery_app/ui/pages/feed_widgets/image_model.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: '',
    ),
  );

  Future<List<ImageModel>> getImages() async {
    try {
      final response =
          await dio.get('https://gallery.prod1.webant.ru/api/photos');
      final List<dynamic> jsonList = response.data;
      final List<ImageModel> images =
          jsonList.map((json) => ImageModel.fromJson(json)).toList();

      return images;
    } catch (error) {
      throw Exception('Failed to fetch images: $error');
    }
  }
}
