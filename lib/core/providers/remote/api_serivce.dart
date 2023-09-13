import 'package:dio/dio.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';

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
}
