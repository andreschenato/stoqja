import 'package:flutter/material.dart';
import 'package:stoque_ja/database/db_config.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'dart:developer' as developer;

void main() async {
  // Teste de conexão com o banco
  // var conexao = await MySqlDBConfiguration().connection;
  // await conexao.connect();
  // var val = await conexao.execute("SELECT * FROM teste");
  // int count = val.numOfRows;
  // developer.log('Numero de colunas: $count');
  // for (var row in val.rows) {
  //   developer.log(row.assoc().toString());
  // }
  /*
    A saída esperada é a seguinte:
    [log] Numero de colunas: 3
    [log] {id: 5, nome: João, idade: 25, email: joao@example.com}
    [log] {id: 6, nome: Maria, idade: 30, email: maria@example.com}
    [log] {id: 7, nome: Pedro, idade: 40, email: pedro@example.com}
  */
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
