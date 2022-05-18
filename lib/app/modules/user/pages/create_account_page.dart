import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/user/components/create_account_form_widget.dart';
import 'package:flutter_food_owner/app/modules/user/components/login_form_widget.dart';
import 'package:flutter_food_owner/app/modules/user/controllers/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountPage extends StatefulWidget {
  final String title;
  const CreateAccountPage({
    Key? key,
    this.title = 'CreateAccountPage',
  }) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  bool _isLogin = false;
  bool _isCreateAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/boy_tablet.png', height: 300),
            const SizedBox(
              height: 20,
            ),
            _isCreateAccount
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = true;
                        _isCreateAccount = false;
                      });
                    },
                    child: const Text(
                      'Já sou cadastrado',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        _isCreateAccount = true;
                        _isLogin = false;
                      });
                    },
                    child: const Text(
                      'Criar conta gratuita',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
            _isLogin ? const LoginFormWidget() : CreateAccountFormWidget()
          ],
        ),
      ),
    );
  }
}
