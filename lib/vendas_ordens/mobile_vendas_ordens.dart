import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';

// Construção da tela de vendas e ordens para mobile

class MobileVendasOrdens extends StatefulWidget {
  const MobileVendasOrdens({super.key});

  @override
  State<MobileVendasOrdens> createState() => _MobileVendasOrdensState();
}

class _MobileVendasOrdensState extends State<MobileVendasOrdens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(tela: 'VendasOrdens'),
      appBar: CustomAppBar(),
    );
  }
}