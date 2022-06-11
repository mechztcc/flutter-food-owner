import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BadgeStatus extends StatelessWidget {
  final bool open;

  const BadgeStatus({
    Key? key,
    required this.open,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: open ? Colors.green : Colors.red,
      padding: const EdgeInsets.all(10),
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(5),
      badgeContent: open
          ? const Text(
              'Aberto',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          : const Text(
              'Fechado',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
      child: Icon(Icons.online_prediction_sharp),
    );
  }
}
