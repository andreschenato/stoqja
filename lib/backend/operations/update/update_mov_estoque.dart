import 'package:stoque_ja/database/db_config.dart';

// Função que recebe os dados da movEstoque e atualiza no banco

Future editMovEstoque(
  String idMovEstoque,
  String descricao,
  String idProduto,
  String tipo,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao
      .execute("UPDATE MovEstoque SET descricao = '$descricao', tipo = '$tipo', FK_idProduto = '$idProduto' "
          " WHERE idMovEstoque = '$idMovEstoque'");
  await conexao.close();
}
