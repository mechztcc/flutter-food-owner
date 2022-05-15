import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/man_notebook.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Turbine suas vendas, com o nosso APP',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
