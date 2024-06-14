import 'package:stoque_ja/database/db_config.dart';

// Função que puxa os dados de uma venda pelo id

Future<Map<String, dynamic>> selectVenda(String idVenda) async {
  Map<String, dynamic> venda = {};
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Carrinho WHERE idCarrinho = $idVenda");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    venda = data;
  }
  await conexao.close();
  return venda;
}