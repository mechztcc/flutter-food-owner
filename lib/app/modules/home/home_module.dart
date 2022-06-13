import 'package:flutter_food_owner/app/modules/home/pages/create_store_page.dart';
import 'package:flutter_food_owner/app/modules/home/pages/home_page.dart';
import 'package:flutter_food_owner/app/modules/home/pages/splash_page.dart';
import 'package:flutter_food_owner/app/modules/home/repositories/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/controllers/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i()), export: true),
    Bind.lazySingleton((i) => HomeRepository(i(), i()), export: true),
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
    ChildRoute(
      '/create-store/',
      child: (_, args) => const CreateStorePage(),
    )
  ];
}
