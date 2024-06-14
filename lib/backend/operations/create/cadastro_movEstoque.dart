import 'package:stoque_ja/database/db_config.dart';

/*
   Função que recebe os valores passados para ela 
   e cadastra as informações no banco com base neles.
*/

Future cadastroMovEstoque(
  String? descricao,
  String? tipo,
  String? idProduto,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute(
    "INSERT INTO MovEstoque (tipo, descricao, FK_idProduto)" 
    " VALUES ( :tipo, :descricao, :idProduto)", 
    {
      "tipo": tipo,
      "descricao": descricao,
      "idProduto": idProduto,
    },
  );
  await conexao.close();
}
