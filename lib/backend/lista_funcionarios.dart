import 'package:stoque_ja/database/db_config.dart';

Future<List<Map<String, dynamic>>> listaFuncionarios() async {
  List<Map<String, dynamic>> funcionarios = <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Funcionario");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    funcionarios.add(data);
  }
  await conexao.close();
  return funcionarios;
}