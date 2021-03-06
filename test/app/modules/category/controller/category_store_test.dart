import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_food_owner/app/modules/category/controller/category_store.dart';
 
void main() {
  late CategoryStore store;

  setUpAll(() {
    store = CategoryStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}