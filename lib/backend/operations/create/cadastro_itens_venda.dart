import 'package:stoque_ja/database/db_config.dart';

/*
   Função que recebe os valores passados para ela 
   e cadastra um item de venda no banco com base neles.
*/

Future cadastroItensVenda(
  String? idProduto,
  String? idCarrinho,
  String? quantidade,
  String? valorItens,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute(
    "INSERT INTO ItensVenda (FK_idProduto, FK_idCarrinho, quantidade, valorItens)"
    " VALUES (:idProduto, :idCarrinho, :quantidade, :valorItens)",
    {
      "idProduto": idProduto,
      "idCarrinho": idCarrinho,
      "quantidade": quantidade,
      "valorItens": valorItens,
    },
  );
  await conexao.execute(
    "UPDATE Produto SET quantidade = quantidade - :quantidade WHERE idProduto = :idProduto",
    {
      "idProduto": idProduto,
      "quantidade": quantidade,
    },
  );
  await conexao.execute(
    "UPDATE Carrinho "
    "SET valorTotal = (SELECT IFNULL(SUM(valorItens), 0) FROM ItensVenda WHERE FK_idCarrinho = :idCarrinho) "
    "WHERE idCarrinho = :idCarrinho",
    {
      "idCarrinho": idCarrinho,
    },
  );
  await conexao.close();
}
