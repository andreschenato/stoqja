import 'package:stoque_ja/backend/classes/pessoa.dart';

class Cliente extends PessoaEmpresa {
  Cliente({
    super.nome,
    super.cpfCnpj,
    super.telefone,
    super.email,
    super.endereco,
    super.cep,
    super.numEndereco,
    super.complemento,
    super.bairro,
  });
}
