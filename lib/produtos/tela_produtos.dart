import 'package:flutter/material.dart';
import 'package:stoque_ja/produtos/desktop_produtos.dart';
import 'package:stoque_ja/produtos/mobile_produtos.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

// Tela de produtos, usa o widget "responsivo"
// para redirecionar para desktop ou mobile

class TelaProdutos extends StatelessWidget {
  const TelaProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileProdutos(),
        desktop: DesktopProdutos(),
      ),
    );
  }
}
