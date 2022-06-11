import 'package:flutter_food_owner/app/modules/user/controllers/user_store.dart';
import 'package:flutter_food_owner/app/modules/user/pages/create_account_page.dart';
import 'package:flutter_food_owner/app/modules/user/pages/login_page.dart';
import 'package:flutter_food_owner/app/modules/user/repositories/users_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersRepository(i(), i()), export: true),
    Bind.lazySingleton((i) => UserStore(i()), export: true),
  ];

  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/create',
      child: (_, args) => CreateAccountPage(),
    ),
    ChildRoute('/login', child: (_, args) => LoginPage()),
  ];
}
