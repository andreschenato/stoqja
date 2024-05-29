import 'package:stoque_ja/database/db_config.dart';

// Função temporária, logo será substituída
// Serve para selecionar um usuário para o login

Future userList() async {
  List<String> users = <String>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT nome FROM Funcionario");
  for (var row in val.rows) {
    Map data = row.assoc();
    users.add('${data['nome']}');
  }
  await conexao.close();
  return users;
}
