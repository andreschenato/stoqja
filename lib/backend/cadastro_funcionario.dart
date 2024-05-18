import 'package:stoque_ja/database/db_config.dart';

/*
   Função que recebe os valores passados para ela 
   e cadastra o usuário no banco com base neles.
*/

Future cadastroFuncionario(
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
  await conexao.execute(
    "INSERT INTO Funcionario (nome, senha, cargo, cpf, telefone, email, cep, endereco, numEndereco, complemento, bairro, FK_idCidade)"
    " VALUES (:nome, :senha, :cargo, :cpf, :telefone, :email, :cep, :endereco, :numEndereco, :complemento, :bairro, :idCidade)",
    {
      "nome": nome,
      "senha": senha,
      "cargo": cargo,
      "cpf": cpf,
      "telefone": telefone,
      "email": email,
      "cep": cep,
      "endereco": endereco,
      "numEndereco": numEndereco,
      "complemento": complemento,
      "bairro": bairro,
      "idCidade": idCidade,
    },
  );
  await conexao.close();
}
