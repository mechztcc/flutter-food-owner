import 'package:dio/dio.dart';

class UsersRepository {
  final Dio _dio;

  UsersRepository({
    required dio,
  }) : _dio = dio;
}
