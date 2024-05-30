import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';

// Construção da tela de movimentação de estoque para desktop

class DesktopMovEstoque extends StatefulWidget {
  const DesktopMovEstoque({super.key});

  @override
  State<DesktopMovEstoque> createState() => _DesktopMovEstoqueState();
}

class _DesktopMovEstoqueState extends State<DesktopMovEstoque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DesktopAppBar(),
    );
  }
}
