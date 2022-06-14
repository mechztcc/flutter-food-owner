import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/core/utils/custom_snackbar.dart';
import 'package:flutter_food_owner/app/modules/user/controllers/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

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
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  bool isAccepted = false;

  String name = '';
  String password = '';
  String email = '';

  _validateForm() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid ?? false) {
      try {
        await controller.createAccount(name, email, password);
        CustomSnackbar(
          context: context,
          message: 'Conta criada com sucesso!',
        ).success();
      } catch (e) {
        CustomSnackbar(
          context: context,
          message: 'E-mail em uso',
        ).warning();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Text(
                'Novo usuário',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: Validatorless.multiple(
                  [Validatorless.required('Nome obrigatório')],
                ),
                controller: _nameEC,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
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
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail obrigatório'),
                  Validatorless.email('E-mail inválido'),
                ]),
                controller: _emailEC,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
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
                validator: Validatorless.multiple([
                  Validatorless.required('Senha obrigatória'),
                  Validatorless.min(
                    6,
                    'A senha deve conter ao menos 6 dígitos',
                  ),
                ]),
                controller: _passwordEC,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
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
              Row(
                children: [
                  Checkbox(
                    value: isAccepted,
                    onChanged: (v) {
                      setState(() {
                        isAccepted = !isAccepted;
                      });
                    },
                  ),
                  const Text(
                    'Eu aceito os termos de privacidade e a politica de acesso ',
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () {
                  isAccepted ? _validateForm() : null;
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
