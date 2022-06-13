import 'dart:developer';

import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:flutter_food_owner/app/modules/user/repositories/users_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  UserModel? _user;

  final UsersRepository _usersRepository;

  _UserStoreBase(this._usersRepository);

  Future<void> createAccount(String name, String email, String password) async {
    await _usersRepository.createAccount(name, email, password);
    Modular.to.pushReplacementNamed('/users/login');
  }

  Future<void> login(String email, String password) async {
    var token = await _usersRepository.login(email, password);

    var box = await Hive.openBox('storage');
    box.put('token', token);
    Modular.to.pushReplacementNamed('/home');
  }

  Future<void> findStoreDetails() async {
    var box = await Hive.openBox('storage');
    String token = box.get('token');

    var store = await _usersRepository.findStoreByLoggedUser(token);
    print(store);
  }

  Future<bool> isLogged() async {
    var box = await Hive.openBox('storage');
    final String token = box.get('token');
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void addUser(UserModel user) {
    _user = UserModel(
      email: 'user.email',
      name: user.name,
      password: user.password,
    );
  }
}
