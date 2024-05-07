import 'package:flutter/material.dart';
import 'package:stoque_ja/produtos/desktop_produtos.dart';
import 'package:stoque_ja/produtos/mobile_produtos.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

class TelaProdutos extends StatefulWidget {
  const TelaProdutos({super.key});

  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
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
