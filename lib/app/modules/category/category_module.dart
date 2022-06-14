import 'package:flutter_food_owner/app/modules/category/controller/category_store.dart';
import 'package:flutter_food_owner/app/modules/category/controller/category_store.dart';
import 'package:flutter_food_owner/app/modules/category/pages/category_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoryStore()),
    Bind.lazySingleton((i) => CategoryStore(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CategoryPage()),
  ];
}
