import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/drawer_component.dart';
import 'package:stoque_ja/menu_principal/menu_buttons.dart';

class MobileMenu extends StatefulWidget {
  const MobileMenu({super.key});

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
        title: SizedBox(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(usuario),
                  Text('Cargo'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: MenuButtons(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
