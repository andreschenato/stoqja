import 'package:stoque_ja/database/db_config.dart';

// Função para listar fornecedores do banco

Future<List<Map<String, dynamic>>> listaFornecedores() async {
  List<Map<String, dynamic>> fornecedores = <Map<String, dynamic>>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Pessoa WHERE tipo = 'Fornecedor'");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    fornecedores.add(data);
  }
  await conexao.close();
  return fornecedores;
}