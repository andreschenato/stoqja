import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/menu_principal/menu_buttons.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

// Construção da tela de menu para mobile

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(tela: 'Menu',),
      appBar: MobileAppbar(usuario),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Align(
              alignment:const AlignmentDirectional(0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const MenuButtons(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
