import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 120,
              child: Image.asset(
                'assets/images/woman_moto.png',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
