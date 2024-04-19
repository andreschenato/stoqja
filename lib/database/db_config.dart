import 'package:stoque_ja/database/db_connect.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:stoque_ja/database/db_variables.dart';

class MySqlDBConfiguration implements DBConfig {
  MySQLConnection? _connection;

  @override
  Future<MySQLConnection> get connection async {
    _connection ??= await createConnection();
    _connection ??= throw Exception('[Error/DB] -> Falha ao criar conexão');
    return _connection!;
  }

  @override
  Future<MySQLConnection> createConnection() async{
    return await MySQLConnection.createConnection(
        host: DBVar.host,
        port: DBVar.port,
        userName: DBVar.user,
        password: DBVar.pass,
        databaseName: DBVar.schema,
    );
  }
}