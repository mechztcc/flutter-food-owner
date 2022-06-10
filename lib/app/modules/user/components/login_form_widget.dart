import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/core/utils/custom_snackbar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_food_owner/app/modules/user/controllers/user_store.dart';

class LoginFormWidget extends StatefulWidget {
  final String title;
  const LoginFormWidget({
    Key? key,
    this.title = "LoginFormWidget",
  }) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller = Modular.get<UserStore>();

  String email = '';
  String password = '';

  _validateForm() async {
    final isValid = _formKey.currentState?.validate();
    if (isValid ?? false) {
      try {
        var response = await _controller.login(email, password);
        CustomSnackbar(
          context: context,
          message: 'Login realizado com sucesso!',
        ).success();
      } catch (e) {
        CustomSnackbar(
          context: context,
          message: 'Credenciais incorretas',
        ).warning();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório.'),
                        Validatorless.email('E-mail inválido')
                      ]),
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
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha é obrigatório'),
                        Validatorless.min(
                          6,
                          'A senha deve conter no mínimo 6 digitos',
                        ),
                      ]),
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
                      height: 20,
                    ),
                    const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        _validateForm();
                      },
                      icon: const Icon(Icons.rocket_launch_rounded),
                      label: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
