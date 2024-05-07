import 'package:stoque_ja/database/db_config.dart';

Future<List<Map<String, dynamic>>> listaClientes() async {
  List<Map<String, dynamic>> clientes = <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Pessoa");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    clientes.add(data);
  }
  await conexao.close();
  return clientes;
}