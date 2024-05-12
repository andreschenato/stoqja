import 'package:stoque_ja/database/db_config.dart';

// Função que recebe os dados do funcionário e atualiza no banco

Future editFuncionario(
  String idFuncionario,
  String nome,
  String senha,
  String cargo,
  String cpf,
  String telefone,
  String email,
  String cep,
  String endereco,
  String numEndereco,
  String complemento,
  String bairro,
  String idCidade,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute("UPDATE Funcionario SET nome = '$nome', senha = '$senha', cargo = '$cargo', cpf = '$cpf', telefone = '$telefone', email = '$email', cep = '$cep', endereco = '$endereco', numEndereco = '$numEndereco', complemento = '$complemento', bairro = '$bairro', FK_idCidade = '$idCidade' WHERE idFuncionario = '$idFuncionario'");
  await conexao.close();
}
