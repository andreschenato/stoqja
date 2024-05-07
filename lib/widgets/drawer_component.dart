import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  final String tela;
  const DrawerComponent({super.key, required this.tela});
  @override
  Widget build(BuildContext context) {
    final String _selectedIndex = tela;
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(usuario),
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
            selected: _selectedIndex == 'Menu',
            onTap: () {
              Navigator.pushNamed(context, '/Menu', arguments: usuario);
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
            selected: _selectedIndex == 'Produtos',
            onTap: () {
              Navigator.pushNamed(context, '/Produtos', arguments: usuario);
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
            selected: _selectedIndex == 'Funcionarios',
            onTap: () {
              Navigator.pushNamed(context, '/Funcionarios', arguments: usuario);
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
            selected: _selectedIndex == 'MovEstoque',
            onTap: () {
              Navigator.pushNamed(context, '/MovEstoque', arguments: usuario);
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
            selected: _selectedIndex == 'Clientes',
            onTap: () {
              Navigator.pushNamed(context, '/Clientes', arguments: usuario);
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
            selected: _selectedIndex == 'VendasOrdens',
            onTap: () {
              Navigator.pushNamed(context, '/VendasOrdens', arguments: usuario);
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
            selected: _selectedIndex == 'Fornecedores',
            onTap: () {
              Navigator.pushNamed(context, '/Fornecedores', arguments: usuario);
            },
          ),
        ],
      ),
    );
  }
}
