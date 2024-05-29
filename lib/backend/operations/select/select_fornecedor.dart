import 'package:stoque_ja/database/db_config.dart';

// Função que pega os atributos de um fornecedor

Future<Map<String, dynamic>> selectFornecedor(String idFornecedor) async {
  Map<String, dynamic> fornecedor = {};
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Pessoa WHERE idPessoa = '$idFornecedor' AND tipo = 'Fornecedor'");
  for(var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    fornecedor = data;
  }
  await conexao.close();
  return fornecedor;
}