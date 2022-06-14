import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_owner/app/modules/home/controllers/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBarWidget extends StatefulWidget {
  int currentIndex;
  BottomBarWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final _controller = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: widget.currentIndex,
      onTap: (i) {
        if (i == 0) {
          setState(() {
            widget.currentIndex = i;
          });
          Modular.to.pushNamed('/home');
        }
        if (i == 2) {
          setState(() {
            widget.currentIndex = i;
          });
          Modular.to.pushNamed('/configuration');
        }
        if (i == 3) {
          _controller.logout();
        }
      },
      items: [
        SalomonBottomBarItem(
          activeIcon: const Icon(Icons.check),
          icon: const Icon(
            Icons.maps_home_work_outlined,
          ),
          title: const Text(
            'Home',
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.chat_bubble_outline,
          ),
          title: const Text(
            'Chat',
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.settings,
          ),
          title: const Text(
            'Configurações',
          ),
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.person_outline,
          ),
          title: const Text(
            'Perfil',
          ),
        ),
      ],
    );
  }
}
