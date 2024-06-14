import 'package:stoque_ja/database/db_config.dart';

// Função que retorna uma lista de vendas do banco

Future<List<Map<String, dynamic>>> listaVendas() async {
  List<Map<String, dynamic>> vendas = <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute(
    "SELECT "
    "Carrinho.*, "
    "Pessoa.nome "
    "FROM "
    "Carrinho "
    "INNER JOIN "
    "Pessoa ON Carrinho.FK_idPessoa = Pessoa.idPessoa"
  );
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    vendas.add(data);
  }
  await conexao.close();
  return vendas;
}