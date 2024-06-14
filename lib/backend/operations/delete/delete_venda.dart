import 'package:stoque_ja/database/db_config.dart';

// Função para deletar uma venda do banco pelo id

Future deleteVenda(selectedId) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("DELETE FROM Carrinho WHERE idCarrinho = '$selectedId'");
  await conexao.close();
}
