import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_food_owner/app/modules/user/repositories/user_repository.dart';
 
void main() {
  late UserRepository repository;

  setUpAll(() {
    repository = UserRepository();
  });
}