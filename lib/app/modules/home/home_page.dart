import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo a loja NomeDaLoja'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: Image.asset(
                      'assets/images/man_notebook.png',
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Column(children: [
                          const Text('Vendas realizadas'),
                          const Text(
                            '0',
                            style: TextStyle(fontSize: 25),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          )
                        ]),
                      ),
                      Card(
                        child: Column(children: [
                          const Text('Produtos cadastrados'),
                          const Text(
                            '0',
                            style: TextStyle(fontSize: 25),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          )
                        ]),
                      ),
                      Card(
                        child: Column(children: [
                          const Text('Categorias cadastradas'),
                          const Text(
                            '0',
                            style: TextStyle(fontSize: 25),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          )
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_bubble,
                  ),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Configurações',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
