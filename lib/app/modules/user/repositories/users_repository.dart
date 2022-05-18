import 'package:dio/dio.dart';
import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:logger/logger.dart';

class UsersRepository {
  final Dio _dio;
  final Logger _log;
  final String _url = 'http://192.168.1.5:3333';

  UsersRepository(
    this._dio,
    this._log,
  );

  Future<void> createAccount(UserModel userModel) async {
    try {
      var json = UserModel(
        email: userModel.email,
        name: userModel.name,
        password: userModel.password,
      ).toJson();
      await _dio.post(
        '$_url/users',
        data: json,
      );
    } on DioError catch (err) {
      _log.i(err.error);
    }
  }
}
