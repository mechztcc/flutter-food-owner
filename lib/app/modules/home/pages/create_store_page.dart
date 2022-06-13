import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_owner/app/modules/home/components/form_create_store.dart';

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
              'assets/images/two_boys.png',
              height: 300,
            ),
            Text(
              'Criar loja gratuita',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
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
