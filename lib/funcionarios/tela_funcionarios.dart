import 'package:flutter/material.dart';
import 'package:stoque_ja/funcionarios/desktop_funcionarios.dart';
import 'package:stoque_ja/funcionarios/mobile_funcionarios.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

// Tela de funcionários, usa o widget "responsivo"
// para redirecionar para a tela mobile ou desktop

class TelaFuncionarios extends StatelessWidget {
  const TelaFuncionarios({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileFunc(),
        desktop: DesktopFunc(),
      ),
    );
  }
}
