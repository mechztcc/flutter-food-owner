import 'package:flutter_food_owner/app/modules/home/models/store_model.dart';
import 'package:flutter_food_owner/app/modules/home/repositories/home_repository.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  StoreModel? _store;

  final HomeRepository _homeRepository;

  HomeStoreBase(this._homeRepository);

  Future<void> getDetails() async {
    var box = await Hive.openBox('storage');
    final String token = box.get('token');

    StoreModel store = await _homeRepository.getStoreDetails(token);

    _store = store;
  }
}
