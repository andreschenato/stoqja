import 'package:stoque_ja/database/db_config.dart';

// Função que mostra o cliente selecionado com base no id

Future<Map<String, dynamic>> selectCliente(String idCliente) async {
  Map<String, dynamic> cliente = {};
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  var val = await conexao.execute("SELECT * FROM Pessoa WHERE idPessoa = '$idCliente' AND tipo = 'Cliente'");
  for (var row in val.rows) {
    Map<String, dynamic> data = row.assoc();
    cliente = data;
  }
  await conexao.close();
  return cliente;
}
