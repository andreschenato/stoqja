import 'package:stoque_ja/database/db_config.dart';

// Função para deletar um cliente do banco pelo id

Future deleteCliente(selectedId) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("DELETE FROM Pessoa WHERE idPessoa = '$selectedId' AND tipo = 'Cliente'");
  await conexao.close();
}
