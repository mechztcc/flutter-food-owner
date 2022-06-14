import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_food_owner/app/modules/category/controller/category_store_store.dart';
 
void main() {
  late CategoryStoreStore store;

  setUpAll(() {
    store = CategoryStoreStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}