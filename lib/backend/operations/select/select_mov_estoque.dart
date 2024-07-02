import 'package:stoque_ja/database/db_config.dart';

// Função que puxa os dados de uma descrição do MovEstoque pelo id

Future<Map<String, dynamic>> selectMovEstoque(String idMovEstoque) async {
  Map<String, dynamic> movEstoque = {};
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao
      .execute("SELECT * FROM MovEstoque WHERE idMovEstoque = $idMovEstoque");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    movEstoque = data;
  }
  await conexao.close();
  return movEstoque;
}
