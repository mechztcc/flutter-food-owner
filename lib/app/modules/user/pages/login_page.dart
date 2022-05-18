import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/user/components/login_form_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/two_boys.png', height: 300),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed('/users/create');
                },
                child: const Text(
                  'Criar conta gratuita',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              const LoginFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
