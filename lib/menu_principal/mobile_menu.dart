import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/menu_principal/menu_buttons.dart';

// Construção da tela de menu para mobile

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(tela: 'Menu',),
      appBar: CustomAppBar(),
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
