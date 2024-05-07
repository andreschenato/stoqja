import 'package:flutter/material.dart';
import 'package:stoque_ja/fornecedores/desktop_fornecedores.dart';
import 'package:stoque_ja/fornecedores/mobile_fornecedores.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

class TelaFornecedores extends StatefulWidget {
  const TelaFornecedores({super.key});

  @override
  State<TelaFornecedores> createState() => _TelaFornecedoresState();
}

class _TelaFornecedoresState extends State<TelaFornecedores> {
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
