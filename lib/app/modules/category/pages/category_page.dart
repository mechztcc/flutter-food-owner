import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_food_owner/app/modules/category/controller/category_store.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  const CategoryPage({
    Key? key,
    this.title = 'Categorias',
  }) : super(key: key);
  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  final CategoryStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: 80,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
