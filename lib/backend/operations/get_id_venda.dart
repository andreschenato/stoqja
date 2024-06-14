import 'package:stoque_ja/database/db_config.dart';

Future<String> getCodVenda() async {
  String? codVenda;
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var result = await conexao
      .execute('SELECT idCarrinho FROM Carrinho ORDER BY idCarrinho DESC LIMIT 1');
  for (final row in result.rows) {
    Map data = row.assoc();
    codVenda = '${data['idCarrinho']}';
  }
  await conexao.close();
  return codVenda!;
}