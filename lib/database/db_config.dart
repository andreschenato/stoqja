import 'package:stoque_ja/utils/custom_env.dart';
// import 'package:mysql1/mysql1.dart';
import 'package:stoque_ja/database/db_connect.dart';
import 'package:mysql_client/mysql_client.dart';

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
        host: await CustomEnv.get<String>(key: 'db_host'),
        port: await CustomEnv.get<int>(key: 'db_port'),
        userName: await CustomEnv.get<String>(key: 'db_user'),
        password: await CustomEnv.get<String>(key: 'db_pass'),
        databaseName: await CustomEnv.get<String>(key: 'db_schema'),
    );
  }
}