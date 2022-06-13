import 'package:dio/dio.dart';
import 'package:flutter_food_owner/app/modules/home/models/store_model.dart';
import 'package:logger/logger.dart';

class HomeRepository {
  final Dio _dio;
  final Logger _log;
  final String _url = 'http://127.0.0.1:3333';

  HomeRepository(
    this._dio,
    this._log,
  );

  Future<StoreModel> getStoreDetails(String token) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await _dio.get(
        '$_url/stores/users',
      );
      StoreModel store = StoreModel.fromJson(response.data);
      return store;
    } on DioError catch (err) {
      _log.d(err.response);
      throw Exception('Store not found');
    }
  }

  Future<void> createStore(StoreModel store, String token) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await _dio.post('$_url/stores/users', data: {
        'name': store.name,
        'description': store.description,
      });
    } on DioError catch (err) {
      _log.d(err.response);
      throw Exception('User not found');
    }
  }
}
