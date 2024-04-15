import 'package:stoque_ja/database/db_config.dart';

Future userList() async {
  List<String> users = <String>[];
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT nome FROM teste");
  for (var row in val.rows) {
    Map data = row.assoc();
    users.add('${data['nome']}');
  }
  return users;
}
