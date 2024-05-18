// routes.dart
import 'package:flutter/material.dart';
import 'package:stoque_ja/clientes/tela_clientes.dart';
import 'package:stoque_ja/fornecedores/tela_fornecedores.dart';
import 'package:stoque_ja/funcionarios/tela_funcionarios.dart';
import 'package:stoque_ja/login/tela_login.dart';
import 'package:stoque_ja/menu_principal/tela_menu.dart';
import 'package:stoque_ja/mov_estoque/tela_movestoque.dart';
import 'package:stoque_ja/produtos/tela_produtos.dart';
import 'package:stoque_ja/vendas_ordens/tela_vendas_ordens.dart';

class Rota {
  static const String login = '/';
  static const String menu = '/Menu';
  static const String funcionario = '/Funcionarios';
  static const String produto = '/Produtos';
  static const String estoque = '/MovEstoque';
  static const String cliente = '/Clientes';
  static const String venda = '/VendasOrdens';
  static const String fornecedor = '/Fornecedores';
}

var rotas = <String, WidgetBuilder>{
  Rota.login: (context) => const TelaLogin(),
  Rota.menu: (context) => const TelaMenu(),
  Rota.funcionario: (context) => const TelaFuncionarios(),
  Rota.produto: (context) => const TelaProdutos(),
  Rota.estoque: (context) => const TelaMovEstoque(),
  Rota.cliente: (context) => const TelaClientes(),
  Rota.venda: (context) => const TelaVendasOrdens(),
  Rota.fornecedor: (context) => const TelaFornecedores(),
};
