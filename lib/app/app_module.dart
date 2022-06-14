import 'package:flutter_food_owner/app/modules/category/category_module.dart';
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
        CategoryModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/users', module: UserModule()),
    ModuleRoute('/configuration', module: CoreModule()),
    ModuleRoute('/categories', module: CategoryModule())
  ];
}
