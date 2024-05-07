import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';

class DesktopProdutos extends StatefulWidget {
  const DesktopProdutos({super.key});

  @override
  State<DesktopProdutos> createState() => _DesktopProdutosState();
}

class _DesktopProdutosState extends State<DesktopProdutos> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: DesktopAppBar(usuario),
    );
  }
}
