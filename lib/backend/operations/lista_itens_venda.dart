import 'package:stoque_ja/database/db_config.dart';

Future<String> getCodVenda() async {
  String? codVenda;
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var result = await conexao
      .execute("SELECT idCarrinho FROM Carrinho ORDER BY idCarrinho DESC LIMIT 1");
  for (final row in result.rows) {
    Map data = row.assoc();
    codVenda = '${data['idCarrinho']}';
  }
  await conexao.close();
  return codVenda!;
}

Future<List<Map<String, dynamic>>> listaItensVenda() async {
  String codVenda = await getCodVenda();
  List<Map<String, dynamic>> itensVenda = <Map<String, dynamic>> [];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM ItensVenda WHERE FK_idCarrinho = '$codVenda'");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    itensVenda.add(data);
  }
  await conexao.close();
  return itensVenda;
}