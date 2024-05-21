import 'package:stoque_ja/database/db_config.dart';

// Função para deletar um cliente do banco pelo id

Future deleteCliente(String selectedId) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("DELETE FROM Pessoa WHERE (idPessoa = '$selectedId', tipo = 'Cliente')");
  await conexao.close();
}
