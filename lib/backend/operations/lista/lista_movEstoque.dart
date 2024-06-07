import 'package:stoque_ja/database/db_config.dart';

// Função que retorna uma lista de movimentação de estoque do banco

Future<List<Map<String, dynamic>>> listaMovEstoque() async {
  List<Map<String, dynamic>> movEstoque = <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM MovEstoque");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    movEstoque.add(data);
  }
  await conexao.close();
  return movEstoque;
}
