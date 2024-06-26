import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'package:stoque_ja/theme/theme.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoggedUser()),
    ],
    child: const StoqJa(),
  ));
}

class StoqJa extends StatelessWidget {
  const StoqJa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'stoqJa',
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      // Rotas do aplicativo
      initialRoute: Rota.login,
      routes: rotas,
    );
  }
}
