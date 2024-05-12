import 'package:flutter/material.dart';
import 'package:stoque_ja/fornecedores/desktop_fornecedores.dart';
import 'package:stoque_ja/fornecedores/mobile_fornecedores.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

// Tela de fornecedores que usa do widget "responsivo"
// para redirecionar para a tela mobile ou desktop

class TelaFornecedores extends StatelessWidget {
  const TelaFornecedores({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileFornecedor(),
        desktop: DesktopFornecedor(),
      ),
    );
  }
}
