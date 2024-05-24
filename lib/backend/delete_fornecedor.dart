import 'package:stoque_ja/database/db_config.dart';

// Função para deletar do banco um fornecedor com base no id

Future deleteFornecedor(selectedId) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("DELETE FROM Pessoa WHERE idPessoa = '$selectedId' AND tipo = 'Fornecedor'");
  await conexao.close();
}