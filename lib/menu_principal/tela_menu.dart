import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/desktop_menu.dart';
import 'package:stoque_ja/menu_principal/mobile_menu.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

/* Widget principal da tela de menu, que dependendo
  do valor do widget "Responsivo", redireciona para
  a tela mobile ou desktop */

class TelaMenu extends StatelessWidget {
  const TelaMenu({super.key});

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
