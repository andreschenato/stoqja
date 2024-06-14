import 'package:stoque_ja/database/db_config.dart';

Future<List<Map<String, dynamic>>> listaItensVenda(String codVenda) async {
  List<Map<String, dynamic>> itensVenda = <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT "
      "ItensVenda.*, "
      "Produto.nomeProduto, "
      "Produto.valor "
      "FROM ItensVenda "
      "INNER JOIN "
      "Produto ON ItensVenda.FK_idProduto = Produto.idProduto "
      "WHERE FK_idCarrinho = '$codVenda'");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    itensVenda.add(data);
  }
  await conexao.close();
  return itensVenda;
}
