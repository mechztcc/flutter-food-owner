import 'package:flutter_food_owner/app/modules/core/core_module.dart';
import 'package:flutter_food_owner/app/modules/user/user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [
        CoreModule(),
        UserModule(),
        HomeModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/users', module: UserModule()),
  ];
}
