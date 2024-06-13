import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/menu_principal/button.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

// Widget que implementa os botões do widget "GridButton"
// para criar a grade de botões do menu

class MenuButtons extends StatelessWidget {
  const MenuButtons({super.key});
  @override
  Widget build(BuildContext context) {
    bool isAdm;
    int axisItemsCount;
    double heightbox = MediaQuery.of(context).size.height;
    return Consumer<LoggedUser>(
      builder: (context, value, child) {
        value.cargo.toString().toLowerCase() == 'administrador' ||
                value.cargo.toString().toLowerCase() == 'gerente'
            ? isAdm = true
            : isAdm = false;
        MediaQuery.of(context).size.width < 650
            ? (axisItemsCount = 2)
            : (isAdm ? axisItemsCount = 3 : axisItemsCount = 2);
        return Scaffold(
          body: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: heightbox,
                maxWidth: 800,
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
                      Navigator.pushNamed(context, Rota.produto);
                    },
                    icone: Icons.local_mall,
                  ),
                  if (isAdm)
                    GridButton(
                      textoBotao: "Funcionários",
                      onPressed: () {
                        Navigator.pushNamed(context, Rota.funcionario);
                      },
                      icone: Icons.groups,
                    ),
                  GridButton(
                    textoBotao: "Mov. Estoque",
                    onPressed: () {
                      Navigator.pushNamed(context, Rota.estoque);
                    },
                    icone: Icons.moving_rounded,
                  ),
                  GridButton(
                    textoBotao: "Clientes",
                    onPressed: () {
                      Navigator.pushNamed(context, Rota.cliente);
                    },
                    icone: Icons.person,
                  ),
                  GridButton(
                    textoBotao: "Vendas e ordens",
                    onPressed: () {
                      Navigator.pushNamed(context, Rota.venda);
                    },
                    icone: Icons.assignment,
                  ),
                  if (isAdm)
                    GridButton(
                      textoBotao: "Fornecedores",
                      onPressed: () {
                        Navigator.pushNamed(context, Rota.fornecedor);
                      },
                      icone: Icons.local_shipping_rounded,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
