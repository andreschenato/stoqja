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
    final String selectedIndex = tela;
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Drawer(
      child: ListView(
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
              Navigator.pushNamed(context, Rota.menu, arguments: usuario);
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
              Navigator.pushNamed(context, Rota.produto, arguments: usuario);
            },
          ),
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
              Navigator.pushNamed(context, Rota.funcionario, arguments: usuario);
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
              Navigator.pushNamed(context, Rota.estoque, arguments: usuario);
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
              Navigator.pushNamed(context, Rota.cliente, arguments: usuario);
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
              Navigator.pushNamed(context, Rota.venda, arguments: usuario);
            },
          ),
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
              Navigator.pushNamed(context, Rota.fornecedor, arguments: usuario);
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
              Navigator.pushNamed(context, Rota.login, arguments: usuario);
            },
          ),
        ],
      ),
    );
  }
}
