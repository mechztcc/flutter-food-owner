import 'package:flutter_food_owner/app/modules/home/pages/splash_page.dart';
import 'package:flutter_food_owner/app/modules/user/pages/create_account_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const CreateAccountPage()),
  ];
}
