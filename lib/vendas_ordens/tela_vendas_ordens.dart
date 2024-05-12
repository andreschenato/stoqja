import 'package:flutter/material.dart';
import 'package:stoque_ja/responsive/responsivo.dart';
import 'package:stoque_ja/vendas_ordens/desktop_vendas_ordens.dart';
import 'package:stoque_ja/vendas_ordens/mobile_vendas_ordens.dart';

// Tela de vendas e ordens que redireciona para a versão
// mobile ou desktop se baseando no widget "responsivo"

class TelaVendasOrdens extends StatelessWidget {
  const TelaVendasOrdens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileVendasOrdens(),
        desktop: DesktopVendasOrdens(),
      ),
    );
  }
}
