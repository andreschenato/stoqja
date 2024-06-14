import 'package:stoque_ja/database/db_config.dart';

Future<int> getCodigo() async {
  int? cod;
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var result = await conexao
      .execute('SELECT codigo FROM Carrinho ORDER BY idCarrinho DESC LIMIT 1');
  for (final row in result.rows) {
    Map data = row.assoc();
    cod = int.parse('${data['codigo']}');
  }
  await conexao.close();
  cod == null ? cod = 1 : cod = cod + 1;
  return cod;
}

Future createCarrinho(idFunc) async {
  var conexao = await MySqlDBConfiguration().connection;
  int cod = await getCodigo();
  await conexao.connect();
  await conexao.execute(
    "INSERT INTO Carrinho(valorTotal, FK_idFuncionario, FK_idPessoa, status, codigo)"
    " VALUES(:total, :idFunc, :idPessoa, :status, :codigo)",
    {
      "total": 0,
      "idFunc": idFunc,
      "idPessoa": 1,
      "status": 'Em andamento',
      "codigo": cod,
    },
  );
  await conexao.close();
}