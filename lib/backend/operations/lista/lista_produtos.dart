import 'package:stoque_ja/database/db_config.dart';

// Função que retorna uma lista de produtos do banco

Future<List<Map<String, dynamic>>> listaProdutos() async {
  List<Map<String, dynamic>> produtos= <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Produto");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    produtos.add(data);
  }
  await conexao.close();
  return produtos;
}