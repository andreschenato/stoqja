import 'package:flutter/material.dart';
import 'package:stoque_ja/clientes/tela_clientes.dart';
import 'package:stoque_ja/fornecedores/tela_fornecedores.dart';
import 'package:stoque_ja/funcionarios/tela_funcionarios.dart';
import 'package:stoque_ja/login/tela_login.dart';
import 'package:stoque_ja/menu_principal/tela_menu.dart';
import 'package:stoque_ja/mov_estoque/tela_movestoque.dart';
import 'package:stoque_ja/produtos/tela_produtos.dart';
import 'package:stoque_ja/vendas_ordens/tela_vendas_ordens.dart';

var rotas = <String, WidgetBuilder>{
  '/': (context) => const TelaLogin(),
  '/Menu': (context) => const TelaMenu(),
  '/Funcionarios': (context) => const TelaFuncionarios(),
  '/Produtos': (context) => const TelaProdutos(),
  '/MovEstoque': (context) => const TelaMovEstoque(),
  '/Clientes': (context) => const TelaClientes(),
  '/VendasOrdens': (context) => const TelaVendasOrdens(),
  '/Fornecedores': (context) => const TelaFornecedores(),
};
