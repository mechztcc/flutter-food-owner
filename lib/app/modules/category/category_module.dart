import 'package:flutter_food_owner/app/modules/category/controller/category_store.dart';
import 'package:flutter_food_owner/app/modules/category/pages/category_page.dart';
import 'package:flutter_food_owner/app/modules/category/repository/categories_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoryStore(i()), export: true),
    Bind.lazySingleton((i) => CategoriesRepository(i(), i()), export: true)
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CategoryPage()),
  ];
}
