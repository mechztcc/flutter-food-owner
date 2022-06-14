import 'package:flutter/material.dart';
import 'package:flutter_food_owner/app/modules/core/pages/loading_page.dart';
import 'package:flutter_food_owner/app/modules/home/components/card_button_widget.dart';
import 'package:flutter_food_owner/app/modules/home/controllers/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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

  findStoreDetails() async {
    await controller.getDetails();
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    findStoreDetails();
    setState(() {
      isLoading = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingPage()
        : Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              title: Observer(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.name,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.shopify_rounded,
                        color: Colors.white,
                      )
                    ],
                  );
                },
              ),
            ),
            body: Center(
              child: Observer(
                builder: (_) => Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            child: Image.asset(
                              'assets/images/two_boys.png',
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
                    SalomonBottomBar(
                      onTap: (i) {
                        if (i == 0) {
                          Modular.to.pushNamed('/home');
                        }
                        if (i == 3) {
                          controller.logout();
                        }
                      },
                      items: [
                        SalomonBottomBarItem(
                          activeIcon: const Icon(Icons.check),
                          icon: const Icon(
                            Icons.maps_home_work_outlined,
                          ),
                          title: const Text(
                            'Home',
                          ),
                        ),
                        SalomonBottomBarItem(
                          icon: const Icon(
                            Icons.chat_bubble_outline,
                          ),
                          title: const Text(
                            'Chat',
                          ),
                        ),
                        SalomonBottomBarItem(
                          icon: const Icon(
                            Icons.settings,
                          ),
                          title: const Text(
                            'Configurações',
                          ),
                        ),
                        SalomonBottomBarItem(
                          icon: const Icon(
                            Icons.person_outline,
                          ),
                          title: const Text(
                            'Perfil',
                          ),
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
