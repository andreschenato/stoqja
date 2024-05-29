import 'package:stoque_ja/database/db_config.dart';

// Função que usa os dados para atualizar um cadastro de fornecedor

Future editFornecedor(
  String idFornecedor,
  String nome,
  String nomeFantasia,
  String cpfCnpj,
  String telefone,
  String email,
  String endereco,
  String cep,
  String numEndereco,
  String complemento,
  String bairro,
  String idCidade,
) async {
  var conexao = await MySqlDBConfiguration().connection;
  await conexao.connect();
  await conexao.execute(
    "UPDATE Cliente SET "
    "nome = '$nome', nomeFantasia = '$nomeFantasia', cpfCnpj = '$cpfCnpj' "
    "telefone = '$telefone', email = '$email', endereco = '$endereco' "
    "cep = '$cep', numEndereco = '$numEndereco', complemento = '$complemento' "
    "bairro = '$bairro', FK_idCidade = '$idCidade' "
    "WHERE idPessoa = '$idFornecedor' AND tipo = 'Fornecedor'"
  );
  await conexao.close();
}