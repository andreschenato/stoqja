import 'package:mysql_client/mysql_client.dart';
import 'package:stoque_ja/database/db_variables_exemple.dart';

// Classe abstrata para configuração da conexão com o banco

abstract class DBConfig {
  Future<dynamic> createConnection();

  Future<dynamic> get connection;
}

// Classe que realiza a conexão com o banco
// É chamada nas funções que buscam dados no banco

class MySqlDBConfiguration implements DBConfig {
  MySQLConnection? _connection;

  // Chama a conexão com o banco

  @override
  Future<MySQLConnection> get connection async {
    _connection ??= await createConnection();
    _connection ??= throw Exception('[Error/DB] -> Falha ao criar conexão');
    return _connection!;
  }

  // Cria a conexão com o banco usando os parâmetros da classe DBVar

  @override
  Future<MySQLConnection> createConnection() async {
    return await MySQLConnection.createConnection(
      host: DBVar.host,
      port: DBVar.port,
      userName: DBVar.user,
      password: DBVar.pass,
      databaseName: DBVar.schema,
    );
  }
}
