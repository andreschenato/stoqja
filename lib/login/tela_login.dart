// tela_login.dart
import 'package:flutter/material.dart';
import 'package:stoque_ja/login/desktop_login.dart';
import 'package:stoque_ja/login/mobile_login.dart';
import '../../responsive/responsivo.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsivo(
      mobile: MobileLogin(),
      desktop: DesktopLogin(),
    );
  }
}

/* Tela que se baseia no widget "Responsivo" 
para redirecionar para a tela mobile ou desktop
conforme o tamanho da tela do dispositivo */