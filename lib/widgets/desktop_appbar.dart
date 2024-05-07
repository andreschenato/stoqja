import 'package:flutter/material.dart';

class DesktopAppBar extends StatefulWidget implements PreferredSizeWidget{
  const DesktopAppBar(String usuario, {super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return AppBar(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(usuario),
                Text('Cargo'),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll<Color>(Colors.transparent)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Encerrar sessão',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
