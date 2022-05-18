import 'package:dio/dio.dart';
import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class UsersRepository {
  final Dio _dio;
  final Logger _log;
  final String _url = 'http://192.168.1.2:3333';

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
      Modular.to.pushReplacementNamed('/users/login');
    } on DioError catch (err) {
      _log.d(err.response);
      throw Exception('Email em uso!');
    }
  }
}
