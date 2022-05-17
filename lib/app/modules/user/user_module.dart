import 'package:flutter_food_owner/app/modules/user/repositories/users_repository.dart';
import 'package:flutter_food_owner/app/modules/user/pages/user_page.dart';
import 'package:flutter_food_owner/app/modules/user/controllers/user_store.dart';

import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersRepository(dio: i())),
    Bind.lazySingleton((i) => UserStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UserPage()),
  ];
}
