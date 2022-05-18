import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/user/controllers/user_store.dart';
import 'package:flutter_food_owner/app/modules/user/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountFormWidget extends StatefulWidget {
  final String title;
  const CreateAccountFormWidget({
    Key? key,
    this.title = "CreateAccountFormWidget",
  }) : super(key: key);

  @override
  State<CreateAccountFormWidget> createState() =>
      _CreateAccountFormWidgetState();
}

class _CreateAccountFormWidgetState extends State<CreateAccountFormWidget> {
  final controller = Modular.get<UserStore>();
  final _formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
      ),
    );
  }
}
