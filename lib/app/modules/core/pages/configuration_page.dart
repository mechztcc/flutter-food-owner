import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_owner/app/modules/core/components/BottomBar_widget.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            BottomBarWidget(
              currentIndex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
