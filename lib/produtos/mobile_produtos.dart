import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

// Construção da produtos de estoque para mobile

class MobileProdutos extends StatefulWidget {
  const MobileProdutos({super.key});

  @override
  State<MobileProdutos> createState() => _MobileProdutosState();
}

class _MobileProdutosState extends State<MobileProdutos> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(
        tela: 'Produtos',
      ),
      appBar: MobileAppbar(usuario),
    );
  }
}
