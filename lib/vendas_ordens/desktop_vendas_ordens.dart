import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/create_carrinho.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';

// Construção da tela de vendas e ordens para desktop

class DesktopVendasOrdens extends StatefulWidget {
  const DesktopVendasOrdens({super.key});

  @override
  State<DesktopVendasOrdens> createState() => _DesktopVendasOrdensState();
}

class _DesktopVendasOrdensState extends State<DesktopVendasOrdens> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: DesktopAppBar(usuario),
      body: Column(
        children: [
          FunctionButtons(
            onPressedNovo: () {
              createCarrinho(2);

            },
            onPressedEdit: () {},
            onPressedDelete: () {},
          ),
        ],
      ),
    );
  }
}
