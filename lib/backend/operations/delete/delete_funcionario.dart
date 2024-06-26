import 'package:stoque_ja/database/db_config.dart';

// Função para deletar um funcionário do banco de dados

Future deleteFuncionario(selectedId) async{
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute('DELETE FROM Funcionario WHERE idFuncionario = $selectedId');
  await conexao.close();
}