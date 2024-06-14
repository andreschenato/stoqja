import 'package:stoque_ja/database/db_config.dart';

// Função que recebe os dados da venda e atualiza no banco

Future editVenda(
  String idVenda,
  String valorTotal,
  String idFuncionario,
  String idCliente,
  String descricao,
  String laudo,
  String status,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("UPDATE Carrinho SET valorTotal = '$valorTotal', FK_idFuncionario = '$idFuncionario', FK_idPessoa = '$idCliente',"
  " descricao = '$descricao', laudo = '$laudo', status = '$status'"
  " WHERE idCarrinho = '$idVenda'");
  await conexao.close();
}
