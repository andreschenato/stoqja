import 'package:stoque_ja/database/db_config.dart';

/*
  Função que recebe os valores passados para ela
  e cadastra o usuário no banco.
*/

Future cadastroCliente(
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
    "INSERT INTO Pessoa (nome, nomeFantasia, cpfCnpj, telefone,"
    " email, tipo, cep, endereco, numEndereco, complemento, bairro, FK_idCidade)"
    " VALUES (:nome, :nomeFantasia, :cpfCnpj, :telefone"
    " :email, :tipo, :cep, :endereco, :numEndereco, :complemento, :bairro, :idCidade)",
    {
      "nome": nome,
      "nomeFantasia": nomeFantasia,
      "cpfCnpj": cpfCnpj,
      "telefone": telefone,
      "email": email,
      "tipo": "Cliente",
      "endereco": endereco,
      "cep": cep,
      "numEndereco": numEndereco,
      "complemento": complemento,
      "bairro": bairro,
      "idCidade": idCidade,
    },
  );
  await conexao.close();
}