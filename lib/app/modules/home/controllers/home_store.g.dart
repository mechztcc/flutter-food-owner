// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_storeAtom =
      Atom(name: 'HomeStoreBase._store', context: context);

  @override
  StoreModel? get _store {
    _$_storeAtom.reportRead();
    return super._store;
  }

  @override
  set _store(StoreModel? value) {
    _$_storeAtom.reportWrite(value, super._store, () {
      super._store = value;
    });
  }

  late final _$getDetailsAsyncAction =
      AsyncAction('HomeStoreBase.getDetails', context: context);

  @override
  Future<void> getDetails() {
    return _$getDetailsAsyncAction.run(() => super.getDetails());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
