import 'package:flutter_food_owner/app/modules/home/models/store_model.dart';
import 'package:flutter_food_owner/app/modules/home/repositories/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  StoreModel? _store;

  final HomeRepository _homeRepository;

  HomeStoreBase(this._homeRepository);

  @action
  Future<void> getDetails() async {
    var box = await Hive.openBox('storage');
    final String token = box.get('token');

    try {
      StoreModel store = await _homeRepository.getStoreDetails(token);
      _store = store;
    } catch (e) {
      Modular.to.pushReplacementNamed('/create-store/');
    }
  }

  Future<void> createStore(String name, String description) async {
    try {
      var box = await Hive.openBox('storage');
      final String token = box.get('token');

      StoreModel store = StoreModel(name: name, description: description);

      await _homeRepository.createStore(store, token);
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    var box = await Hive.openBox('storage');
    box.delete('token');

    Modular.to.pushReplacementNamed('/users/login');
  }

  String get name => _store?.name ?? ' Store not found';
  String get description => _store?.description ?? ' Description not found';

  bool get store {
    if (_store?.id != null) {
      return true;
    } else {
      return false;
    }
  }
}
