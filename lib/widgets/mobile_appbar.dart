import 'package:flutter/material.dart';

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppbar(String usuario, {super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  State<MobileAppbar> createState() => _MobileAppbarState();
}

class _MobileAppbarState extends State<MobileAppbar> {
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
