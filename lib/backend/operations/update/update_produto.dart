import 'package:stoque_ja/database/db_config.dart';

// Função que recebe os dados do produto e atualiza no banco

Future editProduto(
  String idProduto,
  String nomeProduto,
  String tipo,
  String valorController,
  String observacao,
  String categoria,
  String quantidadeController,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("UPDATE Produto SET nomeProduto = '$nomeProduto', valor = '$valorController', observacao = '$observacao',"
  " categoria = '$categoria', tipo = '$tipo', quantidade = '$quantidadeController'"
  " WHERE idProduto = '$idProduto'");
  await conexao.close();
}
