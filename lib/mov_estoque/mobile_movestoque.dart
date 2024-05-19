import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

// Construção da tela de movimentação de estoque para mobile

class MobileMovEstoque extends StatefulWidget {
  const MobileMovEstoque({super.key});

  @override
  State<MobileMovEstoque> createState() => _MobileMovEstoqueState();
}

class _MobileMovEstoqueState extends State<MobileMovEstoque> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(tela: 'MovEstoque'),
      appBar: MobileAppbar(usuario),
    );
  }
}
