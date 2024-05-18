// main.dart
import 'package:flutter/material.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'theme.dart';
import 'custom_app_bar.dart';

void main() {
  runApp(const StoqJa());
}

class StoqJa extends StatefulWidget {
  const StoqJa({super.key});

  @override
  _StoqJaState createState() => _StoqJaState();
}

class _StoqJaState extends State<StoqJa> {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, currentTheme, _) {
        return MaterialApp(
          title: 'stoqJa',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: currentTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: Rota.login,
          routes: rotas,
          builder: (context, child) {
            return Scaffold(
              appBar: CustomAppBar(themeMode: _themeMode),
              body: child,
            );
          },
        );
      },
    );
  }
}
