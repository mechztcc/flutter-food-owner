import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/user/components/create_account_form_widget.dart';
import 'package:flutter_food_owner/app/modules/user/components/login_form_widget.dart';
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
              Image.asset('assets/images/boy_tablet.png', height: 300),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                onPressed: () {
                  Modular.to.pushReplacementNamed('/users/login');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Já sou cadastrado',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const CreateAccountFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
