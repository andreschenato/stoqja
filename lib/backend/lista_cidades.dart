import 'package:stoque_ja/database/db_config.dart';

Future<List<Map<String, dynamic>>> listaCidades() async {
  List<Map<String, dynamic>> cidades = [];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Cidades");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    cidades.add(data);
  }
  await conexao.close();
  return cidades;
}