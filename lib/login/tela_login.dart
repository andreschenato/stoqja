import 'package:flutter/material.dart';
import 'package:stoque_ja/login/desktop_login.dart';
import 'package:stoque_ja/login/mobile_login.dart';
import '../../responsive/responsivo.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivo(
        mobile: MobileLogin(),
        desktop: DesktopLogin(),
      ),
    );
  }
}
