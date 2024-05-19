// custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<ThemeMode> themeMode;

  const CustomAppBar({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Image(
        image: AssetImage('assets/imagens/stoqja_darkmode.png'),
        height: 40,
      ),
      actions: [
        Switch(
          value: themeMode.value == ThemeMode.dark,
          onChanged: (value) {
            themeMode.value = value ? ThemeMode.dark : ThemeMode.light;
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
