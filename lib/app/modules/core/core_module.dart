import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio(), export: true),
    Bind.lazySingleton((i) => Logger(), export: true)
  ];

  @override
  final List<ModularRoute> routes = [];
}
