import 'package:flutter/material.dart';
import 'package:stoque_ja/clientes/desktop_clientes.dart';
import 'package:stoque_ja/clientes/mobile_clientes.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

// Tela de clientes que usa o widget "responsivo" para
// redirecionar para a tela mobile ou desktop

class TelaClientes extends StatelessWidget {
  const TelaClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileClientes(),
        desktop: DesktopClientes(),
      ),
    );
  }
}
