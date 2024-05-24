import 'package:stoque_ja/database/db_config.dart';

// Função que puxa os dados de um produto pelo id

Future<Map<String, dynamic>> selectProduto(String idProduto) async {
  Map<String, dynamic> produto = {};
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Produto WHERE idProduto = $idProduto");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    produto = data;
  }
  await conexao.close();
  return produto;
}