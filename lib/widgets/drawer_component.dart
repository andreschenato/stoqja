import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

// Drawer usado nas telas mobile para facilitar a navegação

class DrawerComponent extends StatelessWidget {
  final String tela;
  const DrawerComponent({super.key, required this.tela});
  @override
  Widget build(BuildContext context) {
    bool isAdm;
    final String selectedIndex = tela;
    return Drawer(
      child: Consumer<LoggedUser>(
        builder: (context, value, child) {
          value.cargo.toString().toLowerCase() == 'administrador' ||
                  value.cargo.toString().toLowerCase() == 'gerente'
              ? isAdm = true
              : isAdm = false;
          return ListView(
            padding: const EdgeInsets.only(top: 0),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 117, 0, 1),
                  ),
                  child: Consumer<LoggedUser>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                value.username.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                value.cargo.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.door_back_door),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Menu"),
                  ],
                ),
                selected: selectedIndex == 'Menu',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rota.menu,
                  );
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.local_mall),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Produtos"),
                  ],
                ),
                selected: selectedIndex == 'Produtos',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rota.produto,
                  );
                },
              ),
              if (isAdm)
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.groups),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Funcionários"),
                    ],
                  ),
                  selected: selectedIndex == 'Funcionarios',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Rota.funcionario,
                    );
                  },
                ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.moving_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Mov. de Estoque"),
                  ],
                ),
                selected: selectedIndex == 'MovEstoque',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rota.estoque,
                  );
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Clientes"),
                  ],
                ),
                selected: selectedIndex == 'Clientes',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rota.cliente,
                  );
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.assignment),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Vendas e Ordens"),
                  ],
                ),
                selected: selectedIndex == 'VendasOrdens',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rota.venda,
                  );
                },
              ),
              if (isAdm)
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.local_shipping_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Fornecedores"),
                    ],
                  ),
                  selected: selectedIndex == 'Fornecedores',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Rota.fornecedor,
                    );
                  },
                ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.exit_to_app_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sair"),
                  ],
                ),
                selected: selectedIndex == 'Login',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Rota.login,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
