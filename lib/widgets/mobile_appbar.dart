import 'package:flutter/material.dart';

// Widget que cria uma appBar para mobile

class MobileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppbar(String usuario, {super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return AppBar(
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
    );
  }
}
