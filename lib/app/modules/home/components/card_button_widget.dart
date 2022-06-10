import 'package:flutter/material.dart';

class CardButtonWidget extends StatelessWidget {
  final String title;
  const CardButtonWidget({Key? key, this.title = "CardButtonWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}