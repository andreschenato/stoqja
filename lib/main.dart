import 'package:flutter/material.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'theme.dart';
import 'widgets/custom_app_bar.dart';

void main() {
  runApp(StoqJa());
}

class StoqJa extends StatelessWidget {
  StoqJa({super.key});

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
          // Rotas do aplicativo
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
