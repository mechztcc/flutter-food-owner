import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_food_owner/app/modules/core/utils/custom_snackbar.dart';
import 'package:flutter_food_owner/app/modules/home/controllers/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class FormCreateStore extends StatefulWidget {
  const FormCreateStore({Key? key}) : super(key: key);

  @override
  State<FormCreateStore> createState() => _FormCreateStoreState();
}

class _FormCreateStoreState extends State<FormCreateStore> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _descriptionEC = TextEditingController();
  final _controller = Modular.get<HomeStore>();

  _validateForm() async {
    var isValid = _formKey.currentState?.validate();
    if (isValid ?? false) {
      try {
        await _controller.createStore(_nameEC.text, _descriptionEC.text);
        CustomSnackbar(
          context: context,
          message: 'Loja criada com sucesso!',
        ).success();
        Modular.to.pushNamed('/home');
      } catch (e) {
        CustomSnackbar(
          context: context,
          message: 'Falha ao cadastrar Loja',
        ).warning();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Criar loja gratuita',
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameEC,
                validator: Validatorless.multiple([
                  Validatorless.min(5, 'Nome muito curto'),
                  Validatorless.required('Nome é obrigatório'),
                ]),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.shopify_rounded),
                  labelText: 'Nome da loja',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descriptionEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Descrição é obrigatório'),
                  Validatorless.min(20, 'Fale um pouco mais sobre sua loja'),
                ]),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.description),
                  labelText: 'Descrição da loja',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _validateForm();
                  },
                  child: const Text(
                    'Criar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _controller.logout();
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'Sair',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
