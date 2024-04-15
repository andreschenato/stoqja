import 'package:flutter/material.dart';
import 'package:stoque_ja/login/tela_login.dart';
import 'package:stoque_ja/menu_principal/menu.dart';

var rotas = <String, WidgetBuilder>{
  '/' : (context) => const TelaLogin(),
  '/Menu' : (context) => const Menu(),
};