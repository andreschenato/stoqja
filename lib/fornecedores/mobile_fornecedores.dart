import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

// Construção da tela de fornecedores para mobile

class MobileFornecedor extends StatefulWidget {
  const MobileFornecedor({super.key});

  @override
  State<MobileFornecedor> createState() => _MobileFornecedorState();
}

class _MobileFornecedorState extends State<MobileFornecedor> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(
        tela: 'Fornecedores',
      ),
      appBar: MobileAppbar(usuario),
      body: Center(
        child: Text('Fornecedores'),
      ),
    );
  }
}
