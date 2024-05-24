import 'package:stoque_ja/database/db_config.dart';

/*
   Função que recebe os valores passados para ela 
   e cadastra o usuário no banco com base neles.
*/

Future cadastroProduto(
  String? nomeProduto,
    String? tipo,
    double? valor,
    String? observacao,
    String? categoria,
    int? quantidade
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute(
    "INSERT INTO Produto (nomeProduto, tipo, valor, observacao, categoria, quantidade)"
    " VALUES (:nomeProduto, :tipo, :valor, :observacao, :categoria, :quantidade)",
    {
      "nomeProduto": nomeProduto,
      "tipo": tipo,
      "valor": valor,
      "observacao": observacao,
      "categoria": categoria,
      "quantidade": quantidade,
    },
  );
  await conexao.close();
}