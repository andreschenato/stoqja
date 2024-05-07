import 'package:flutter/material.dart';
import 'package:stoque_ja/funcionarios/desktop_funcionarios.dart';
import 'package:stoque_ja/funcionarios/mobile_funcionarios.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

class TelaFuncionarios extends StatefulWidget {
  const TelaFuncionarios({super.key});

  @override
  State<TelaFuncionarios> createState() => _TelaFuncionariosState();
}

class _TelaFuncionariosState extends State<TelaFuncionarios> {
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
