import 'package:stoque_ja/database/db_config.dart';

// Função que puxa uma lista de funcionarios do banco de dados

Future<List<Map<String, dynamic>>> listaFuncionarios() async {
  List<Map<String, dynamic>> funcionario = [];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Funcionario");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    funcionario.add(data);
  }
  await conexao.close();
  return funcionario;
}