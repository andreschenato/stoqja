import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/create/cadastro_cliente.dart';
import 'package:stoque_ja/backend/classes/pessoa.dart';
import 'package:stoque_ja/backend/operations/select/select_cliente.dart';
import 'package:stoque_ja/backend/operations/update/update_cliente.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

// Classe do cliente, usa a classe pessoa como base

class Cliente extends PessoaEmpresa {
  late TextEditingController? nomeFantasia;
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
    super.idCidade,
    String? nomeFantasia,
  }) {
    this.nomeFantasia = TextEditingController(text: nomeFantasia);
  }

  Widget campoNomeFantasia(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        controller: nomeFantasia!,
        label: "Nome Fantasia",
        maxL: 200,
        maxLines: 1,
        warning: cpfCnpj!.text.length == 18 ? "Insira o nome fantasia" : null,
      ),
    );
  }

  void selectCli(String idCliente) async {
    Map<String, dynamic> cliente = await selectCliente(idCliente);
    nome?.text = cliente['nome'];
    nomeFantasia?.text = cliente['nomeFantasia'];
    cpfCnpj?.text = cliente['cpfCnpj'];
    telefone?.text = cliente['telefone'];
    cliente['email'] != null
    ? email?.text = cliente['email']
    : email?.text = '';
    endereco?.text = cliente['endereco'];
    cep?.text = cliente['cep'];
    numEndereco?.text = cliente['numEndereco'];
    cliente['complemento'] != null 
    ? complemento?.text = cliente['complemento']
    : complemento?.text = '';
    bairro?.text = cliente['bairro'];
    idCidade = cliente['FK_idCidade'];
  }

  void updateCliente(String idCliente) {
    editCliente(
      idCliente,
      nome!.text,
      nomeFantasia!.text,
      cpfCnpj!.text,
      telefone!.text,
      email!.text,
      endereco!.text,
      cep!.text,
      numEndereco!.text,
      complemento!.text,
      bairro!.text,
      idCidade!,
    );
  }

  void createCliente() {
    cadastroCliente(
      nome!.text,
      nomeFantasia!.text,
      cpfCnpj!.text,
      telefone!.text,
      email!.text,
      endereco!.text,
      cep!.text,
      numEndereco!.text,
      complemento!.text,
      bairro!.text,
      idCidade!,
    );
  }
}
