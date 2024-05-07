import 'package:stoque_ja/database/db_config.dart';

Future<bool> validaLogin(String usuario, String senha) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var query =
      await conexao.execute("SELECT senha From Funcionario WHERE nome = '$usuario';");
  String? senhaServer;
  for (var row in query.rows) {
    Map data = row.assoc();
    senhaServer = ('${data['senha']}');
  }
  await conexao.close();
  if (senha == senhaServer) {
    return true;
  } else {
    return false;
  }
}
