import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:flutter_food_owner/app/modules/user/repositories/users_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  UserModel? _user;

  final UsersRepository _usersRepository;

  _UserStoreBase(this._usersRepository);

  Future<void> createAccount() async {
    try {
      await _usersRepository.createAccount(_user!);
    } catch (e) {
      print(e);
    }
  }

  void addUser(UserModel user) {
    _user = UserModel(
      email: user.email,
      name: user.name,
      password: user.password,
    );
    print(_user?.email ?? 'aaa');
  }
}
