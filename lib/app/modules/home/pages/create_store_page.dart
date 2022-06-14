import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_owner/app/modules/home/components/form_create_store.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateStorePage extends StatelessWidget {
  const CreateStorePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/woman_solo.png',
              height: 300,
            ),
            const Text(
              'Facil, prático e rápido.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FormCreateStore(),
          ],
        ),
      ),
    );
  }
}
