import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';

// Construção da tela de movimentação de estoque para mobile

class MobileMovEstoque extends StatefulWidget {
  const MobileMovEstoque({super.key});

  @override
  State<MobileMovEstoque> createState() => _MobileMovEstoqueState();
}

class _MobileMovEstoqueState extends State<MobileMovEstoque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(tela: 'MovEstoque'),
      appBar: CustomAppBar(),
    );
  }
}
