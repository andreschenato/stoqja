import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/menu_buttons.dart';

class DesktopMenu extends StatefulWidget {
  const DesktopMenu({super.key});

  @override
  State<DesktopMenu> createState() => _DesktopMenuState();
}

class _DesktopMenuState extends State<DesktopMenu> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          child: Row(
            children: [
              const Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 50,
                  )
                ],
              ),
              const SizedBox(width: 10),
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
                width: 900,
                height: 600,
                child: MenuButtons(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
