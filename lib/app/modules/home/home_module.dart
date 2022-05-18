import 'package:flutter_food_owner/app/app_module.dart';
import 'package:flutter_food_owner/app/modules/home/home_page.dart';
import 'package:flutter_food_owner/app/modules/home/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(), export: true),
  ];

  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SplashPage(),
    ),
    ChildRoute(
      '/home',
      child: (_, args) => const HomePage(),
    ),
  ];
}
