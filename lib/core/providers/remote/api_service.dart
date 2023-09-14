import 'dart:io';

import 'package:dio/dio.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';
import 'package:path_provider/path_provider.dart';

class ApiServices {
  static final Dio _dio = Dio();
  final String _baseUrl = ApiConsts.baseUrl;
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConsts.accessToken}',
          },
        ));
    return response.data;
  }

  Future<String?> downloadAndStoreImage(String? path) async {
    if (path != null) {
      String? imagePath;
      final dio = Dio();

      final response = await dio.get("${ApiConsts.imageBaseUrl}$path",
          options: Options(responseType: ResponseType.bytes));
      final bytes = response.data as List<int>;

      final appDocumentDir = await getApplicationDocumentsDirectory();
      imagePath = '${appDocumentDir.path}$path';

      // Write the downloaded image bytes to the file
      final File imageFile = File(imagePath);
      await imageFile.writeAsBytes(bytes);

      // print(imagePath);

      return imagePath;
    }
    return null;
  }
}
