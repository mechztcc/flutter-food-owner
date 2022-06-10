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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
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
              TextButton.icon(
                onPressed: () {
                  Modular.to.pushReplacementNamed('/users/create');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Criar conta gratuita',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
