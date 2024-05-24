import 'package:stoque_ja/database/db_config.dart';

// Função para deletar um produto do banco de dados

Future deleteProduto(selectedId) async{
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute('DELETE FROM Produto WHERE idProduto = $selectedId');
  await conexao.close();
}