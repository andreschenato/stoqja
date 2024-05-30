import 'package:flutter/material.dart';
import 'package:stoque_ja/menu_principal/menu_buttons.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';

// Construção da tela de menu para desktop

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DesktopAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: SizedBox(
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
