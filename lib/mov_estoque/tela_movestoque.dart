import 'package:flutter/material.dart';
import 'package:stoque_ja/mov_estoque/desktop_movestoque.dart';
import 'package:stoque_ja/mov_estoque/mobile_movestoque.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

class TelaMovEstoque extends StatefulWidget {
  const TelaMovEstoque({super.key});

  @override
  State<TelaMovEstoque> createState() => _TelaMovEstoqueState();
}

class _TelaMovEstoqueState extends State<TelaMovEstoque> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileMovEstoque(),
        desktop: DesktopMovEstoque(),
      ),
    );
  }
}
