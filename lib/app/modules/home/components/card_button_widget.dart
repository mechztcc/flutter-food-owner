import 'package:flutter/material.dart';

class CardButtonWidget extends StatelessWidget {
  final String name;
  final Icon icon;
  const CardButtonWidget({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            icon,
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
