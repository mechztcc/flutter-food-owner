import 'package:flutter_food_owner/app/modules/category/repository/categories_repository.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  final CategoriesRepository _categoriesRepository;

  _CategoryStoreBase(this._categoriesRepository);

  Future<void> createCategory(String name, int storeId) async {
    var box = await Hive.openBox('storage');
    String token = box.get('token');

    await _categoriesRepository.createCategory(name, storeId, token);
  }
}
