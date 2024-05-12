import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

// Construção da tela de vendas e ordens para mobile

class MobileVendasOrdens extends StatefulWidget {
  const MobileVendasOrdens({super.key});

  @override
  State<MobileVendasOrdens> createState() => _MobileVendasOrdensState();
}

class _MobileVendasOrdensState extends State<MobileVendasOrdens> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(tela: 'VendasOrdens'),
      appBar: MobileAppbar(usuario),
    );
  }
}