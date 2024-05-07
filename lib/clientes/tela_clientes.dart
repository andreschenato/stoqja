import 'package:flutter/material.dart';
import 'package:stoque_ja/clientes/desktop_clientes.dart';
import 'package:stoque_ja/clientes/mobile_clientes.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

class TelaClientes extends StatefulWidget {
  const TelaClientes({super.key});

  @override
  State<TelaClientes> createState() => _TelaClientesState();
}

class _TelaClientesState extends State<TelaClientes> {
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
