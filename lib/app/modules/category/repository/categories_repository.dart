import 'package:dio/dio.dart';
import 'package:flutter_food_owner/app/modules/category/models/category_model.dart';
import 'package:logger/logger.dart';

class CategoriesRepository {
  final Dio _dio;
  final Logger _log;
  final String _url = 'http://127.0.0.1:3333';

  CategoriesRepository(this._dio, this._log);

  Future<void> createCategory(String name, int storeId, String token) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      await _dio.post(
        '$_url/categories',
        data: {
          'name': name,
          'store_id': storeId,
        },
      );
    } on DioError catch (err) {
      _log.d(err.response?.data['message']);
      if (err.response?.data != null) {
        throw Exception('${err.response?.data['message']}');
      }
    }
  }
}
