import 'package:stoque_ja/database/db_config.dart';

Future<bool> validaLogin(String usuario, String senha) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var query =
      await conexao.execute("SELECT email From teste WHERE nome = '$usuario';");
  String? _senha;
  for (var row in query.rows) {
    Map data = row.assoc();
    _senha = ('${data['email']}');
  }
  if (senha == _senha) {
    return true;
  } else {
    return false;
  }
}
