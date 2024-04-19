import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
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
            selected: _selectedIndex == 0,
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
            selected: _selectedIndex == 1,
            onTap: () {},
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
            selected: _selectedIndex == 2,
            onTap: () {},
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
            selected: _selectedIndex == 3,
            onTap: () {},
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
            selected: _selectedIndex == 4,
            onTap: () {},
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
            selected: _selectedIndex == 5,
            onTap: () {},
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
            selected: _selectedIndex == 6,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
