import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';

// Construção da tela de fornecedores para desktop

class DesktopFornecedor extends StatefulWidget {
  const DesktopFornecedor({super.key});

  @override
  State<DesktopFornecedor> createState() => _DesktopFornecedorState();
}

class _DesktopFornecedorState extends State<DesktopFornecedor> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: DesktopAppBar(usuario),
      body: Center(
        child: Text('Fornecedores'),
      ),
    );
  }
}
