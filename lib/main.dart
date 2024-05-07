import 'package:flutter/material.dart';
import 'package:stoque_ja/rotas/routes.dart';

void main() {
  runApp(const StoqJa());
}

class StoqJa extends StatelessWidget {
  const StoqJa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stoqJa',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 117, 0, 1)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: rotas,
    );
  }
}
