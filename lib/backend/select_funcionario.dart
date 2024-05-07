import 'package:stoque_ja/database/db_config.dart';

Future<Map<String, dynamic>> selectFuncionario(String idFuncionario) async {
  Map<String, dynamic> funcionario = {};
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Funcionario WHERE idFuncionario = $idFuncionario");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    funcionario = data;
  }
  await conexao.close();
  return funcionario;
}