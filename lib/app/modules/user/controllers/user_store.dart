import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:flutter_food_owner/app/modules/user/repositories/users_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  UserModel? _user;

  final UsersRepository _usersRepository;

  _UserStoreBase(this._usersRepository);

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await _usersRepository.createAccount(name, email, password);
    } catch (e) {}
  }

  void addUser(UserModel user) {
    _user = UserModel(
      email: 'user.email',
      name: user.name,
      password: user.password,
    );
    print(_user?.email ?? 'aaa');
  }
}
