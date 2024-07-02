import 'package:stoque_ja/database/db_config.dart';

// Função para deletar uma descrição do banco de dados

Future deleteMovEstoque(selectedId) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao
      .execute('DELETE FROM MovEstoque WHERE idMovEstoque = $selectedId');
  await conexao.close();
}
