import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';

class CreateAccountFormWidget extends StatelessWidget {
  final String title;
  final Function prepareUser;
  const CreateAccountFormWidget({
    Key? key,
    this.title = "CreateAccountFormWidget",
    required this.prepareUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.person),
                labelText: 'Nome completo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.email),
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.lock),
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: () {
                UserModel user = UserModel(
                  email: 'flutter@email.com',
                  name: 'Flutter APP',
                  password: '123456',
                );
                prepareUser(user);
              },
              icon: const Icon(Icons.rocket_launch_rounded),
              label: const Text(
                'Criar conta',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
