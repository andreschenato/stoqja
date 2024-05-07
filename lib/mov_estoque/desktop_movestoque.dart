import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';

class DesktopMovEstoque extends StatefulWidget {
  const DesktopMovEstoque({super.key});

  @override
  State<DesktopMovEstoque> createState() => _DesktopMovEstoqueState();
}

class _DesktopMovEstoqueState extends State<DesktopMovEstoque> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: DesktopAppBar(usuario),
    );
  }
}
