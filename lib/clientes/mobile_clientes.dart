import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

class MobileClientes extends StatefulWidget {
  const MobileClientes({super.key});

  @override
  State<MobileClientes> createState() => _MobileClientesState();
}

class _MobileClientesState extends State<MobileClientes> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(
        tela: 'Clientes',
      ),
      appBar: MobileAppbar(usuario),
      body: Center(
        child: Text('Clientes'),
      ),
    );
  }
}
