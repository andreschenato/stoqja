import 'package:flutter/material.dart';
import 'package:stoque_ja/mov_estoque/desktop_movestoque.dart';
import 'package:stoque_ja/mov_estoque/mobile_movestoque.dart';
import 'package:stoque_ja/responsive/responsivo.dart';

// Tela de movimentação de estoque que se baseia no widget "responsivo"
// para redirecionar para a tela mobile ou desktop

class TelaMovEstoque extends StatelessWidget {
  const TelaMovEstoque({super.key});

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
