import 'package:dio/dio.dart';
import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class UsersRepository {
  final Dio _dio;
  final Logger _log;
  final String _url = 'http://127.0.0.1:3333';

  UsersRepository(
    this._dio,
    this._log,
  );

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await _dio.post(
        '$_url/users',
        data: {'name': name, 'email': email, 'password': password},
      );
    } on DioError catch (err) {
      _log.d(err.response?.data['message']);
      if (err.response?.data != null) {
        throw Exception('${err.response?.data['message']}');
      }
    }
  }

  Future<String> login(String email, String password) async {
    try {
      var response = await _dio.post(
        '$_url/auth',
        data: {'email': email, 'password': password},
      );
      var token = response.data['token'];
      return token;
    } on DioError catch (err) {
      _log.d(err.response);
      throw Exception('${err.response?.data}');
    }
  }
}
