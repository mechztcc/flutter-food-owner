import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/home/components/card_button_widget.dart';
import 'package:flutter_food_owner/app/modules/home/controllers/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({
    Key? key,
    this.title = "Home",
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();
  var isLoading = false;

  find() async {
    await controller.getDetails();
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    find();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(controller.name);
          },
        ),
      ),
      body: Center(
        child: Observer(
          builder: (_) => Column(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(controller.description),
                    Wrap(
                      children: const [
                        CardButtonWidget(
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.deepOrange,
                          ),
                          name: 'Vendas',
                        ),
                        CardButtonWidget(
                          icon: Icon(
                            Icons.post_add_rounded,
                            color: Colors.deepPurple,
                          ),
                          name: 'Produtos',
                        ),
                        CardButtonWidget(
                          icon: Icon(
                            Icons.content_paste_go,
                            color: Colors.blue,
                          ),
                          name: 'Categorias',
                        ),
                        CardButtonWidget(
                          icon: Icon(
                            Icons.add_business_outlined,
                            color: Colors.cyan,
                          ),
                          name: 'Loja',
                        ),
                        CardButtonWidget(
                          icon: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          name: 'Clientes',
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
      ),
    );
  }
}
