import 'package:stoque_ja/database/db_config.dart';

// Função para salvar os dados do carrinho no banco, 
// serve para atualizar ou na hora de criar um novo

Future salvarVenda(
  String codVenda,
  String valorTotal,
  String idFunc,
  String idClie,
  String status,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("UPDATE Carrinho SET valorTotal = '$valorTotal', FK_idFuncionario = '$idFunc',"
  " FK_idPessoa = '$idClie', status = '$status'"
  " WHERE codigo = '$codVenda'");
  await conexao.close();
}