import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  final String title;
  const CarouselPage({Key? key, this.title = 'CarouselPage'}) : super(key: key);
  @override
  CarouselPageState createState() => CarouselPageState();
}

class CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
