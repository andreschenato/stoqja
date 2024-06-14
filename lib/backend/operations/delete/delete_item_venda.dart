import 'package:stoque_ja/database/db_config.dart';

// Função para deletar um idem de venda do banco pelo id

Future deleteItemVenda(String selectedId, String idVenda) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("DELETE FROM ItensVenda WHERE idItensVenda = '$selectedId'");
  await conexao.execute(
    "UPDATE Carrinho "
    "SET valorTotal = (SELECT IFNULL(SUM(valorItens), 0) FROM ItensVenda WHERE FK_idCarrinho = :idCarrinho) "
    "WHERE idCarrinho = :idCarrinho",
    {
      "idCarrinho": idVenda,
    },
  );
  await conexao.close();
}
