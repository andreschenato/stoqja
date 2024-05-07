import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/desktop_menu.dart';
import 'package:stoque_ja/menu_principal/mobile_menu.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

class TelaMenu extends StatefulWidget {
  const TelaMenu({super.key});

  @override
  State<TelaMenu> createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileMenu(),
        desktop: DesktopMenu(),
      ),
    );
  }
}
