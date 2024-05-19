import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/button.dart';
import 'package:stoque_ja/rotas/routes.dart';

// Widget que implementa os botões do widget "GridButton"
// para criar a grade de botões do menu

class MenuButtons extends StatelessWidget {
  const MenuButtons({super.key});
  @override
  Widget build(BuildContext context) {
    int axisItemsCount;
    MediaQuery.of(context).size.width < 650
        ? (axisItemsCount = 2)
        : (axisItemsCount = 3);
    double heightbox = MediaQuery.of(context).size.height;
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
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
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Rota.produto,
                  arguments: usuario,
                );
              },
              icone: Icons.local_mall,
            ),
            GridButton(
              textoBotao: "Funcionários",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Rota.funcionario,
                  arguments: usuario,
                );
              },
              icone: Icons.groups,
            ),
            GridButton(
              textoBotao: "Mov. Estoque",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Rota.estoque,
                  arguments: usuario,
                );
              },
              icone: Icons.moving_rounded,
            ),
            GridButton(
              textoBotao: "Clientes",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Rota.cliente,
                  arguments: usuario,
                );
              },
              icone: Icons.person,
            ),
            GridButton(
              textoBotao: "Vendas e ordens",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Rota.venda,
                  arguments: usuario,
                );
              },
              icone: Icons.assignment,
            ),
            GridButton(
              textoBotao: "Fornecedores",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Rota.fornecedor,
                  arguments: usuario,
                );
              },
              icone: Icons.local_shipping_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
