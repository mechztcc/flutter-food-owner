import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardButtonWidget extends StatelessWidget {
  final String name;
  final Icon icon;
  final String? route;
  const CardButtonWidget({
    Key? key,
    required this.name,
    required this.icon,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(route ?? '/home');
      },
      child: Card(
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
      ),
    );
  }
}
