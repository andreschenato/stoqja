import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/button.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    int axisItemsCount;
    MediaQuery.of(context).size.width < 650
        ? (axisItemsCount = 2)
        : (axisItemsCount = 3);
    double heightbox = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: heightbox,
          maxWidth: 1000,
          minHeight: 100,
          minWidth: 400,
        ),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: axisItemsCount,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.4,
          ),
          children: [
            GridButton(
              textoBotao: "Produtos",
              onPressed: () {},
              icone: Icons.local_mall,
            ),
            GridButton(
              textoBotao: "Funcionário",
              onPressed: () {},
              icone: Icons.groups,
            ),
            GridButton(
              textoBotao: "Mov. Estoque",
              onPressed: () {},
              icone: Icons.moving_rounded,
            ),
            GridButton(
              textoBotao: "Clientes",
              onPressed: () {},
              icone: Icons.person,
            ),
            GridButton(
              textoBotao: "Vendas e ordens",
              onPressed: () {},
              icone: Icons.assignment,
            ),
            GridButton(
              textoBotao: "Fornecedores",
              onPressed: () {},
              icone: Icons.local_shipping_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
