import 'package:flutter/material.dart';
import 'package:stoque_ja/responsive/responsivo.dart';
import 'package:stoque_ja/vendas_ordens/desktop_vendas_ordens.dart';
import 'package:stoque_ja/vendas_ordens/mobile_vendas_ordens.dart';

class TelaVendasOrdens extends StatefulWidget {
  const TelaVendasOrdens({super.key});

  @override
  State<TelaVendasOrdens> createState() => _TelaVendasOrdensState();
}

class _TelaVendasOrdensState extends State<TelaVendasOrdens> {
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
