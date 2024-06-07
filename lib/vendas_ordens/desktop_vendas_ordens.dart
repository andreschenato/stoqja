import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/backend/operations/create_carrinho.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

// Construção da tela de vendas e ordens para desktop

class DesktopVendasOrdens extends StatefulWidget {
  const DesktopVendasOrdens({super.key});

  @override
  State<DesktopVendasOrdens> createState() => _DesktopVendasOrdensState();
}

class _DesktopVendasOrdensState extends State<DesktopVendasOrdens> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(
      builder: (context, value, child) => Scaffold(
        appBar: const DesktopAppBar(),
        body: Column(
          children: [
            FunctionButtons(
              onPressedNovo: () async {
                createCarrinho(value.idUser);
                final bool? resultado = await showDialog(
                  context: context,
                  builder: (context) => const DialogCadastro(tipo: 'Vendas'),
                );
                if (resultado == true) {
                  
                }
              },
              onPressedEdit: () {},
              onPressedDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}
