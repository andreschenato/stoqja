import 'package:stoque_ja/database/db_config.dart';

// Função que recebe os dados da movEstoque e atualiza no banco

Future editMovEstoque(
  String idMovEstoque,
  String tipo,
  String descricao,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao
      .execute("UPDATE MovEstoque SET descrição = '$descricao', tipo = '$tipo' "
          " WHERE idMovEstoque = '$idMovEstoque'");
  await conexao.close();
}
