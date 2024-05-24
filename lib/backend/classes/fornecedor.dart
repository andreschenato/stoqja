import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/cadastro_fornecedor.dart';
import 'package:stoque_ja/backend/classes/pessoa.dart';
import 'package:stoque_ja/backend/select_fornecedor.dart';
import 'package:stoque_ja/backend/update_fornecedor.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

// Classe do fornecedor, usa a superclasse pessoa como base

class Fornecedor extends PessoaEmpresa {
  late TextEditingController? nomeFantasia;
  Fornecedor(
      {super.nome,
      super.cpfCnpj,
      super.telefone,
      super.email,
      super.endereco,
      super.cep,
      super.numEndereco,
      super.complemento,
      super.bairro,
      super.idCidade,
      String? nomeFantasia}) {
    this.nomeFantasia = TextEditingController(text: nomeFantasia);
  }

  Widget campoNomeFantasia(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        controller: nomeFantasia!,
        label: "Nome Fantasia",
        maxL: 200,
        warning: "Insira o nome fantasia",
      ),
    );
  }

  void selectForn(String idFornecedor) async {
    Map<String, dynamic> fornecedor = await selectFornecedor(idFornecedor);
    nome?.text = fornecedor['nome'];
    nomeFantasia?.text = fornecedor['nomeFantasia'];
    cpfCnpj?.text = fornecedor['cpfCnpj'];
    telefone?.text = fornecedor['telefone'];
    fornecedor['email'] != null
        ? email?.text = fornecedor['email']
        : email?.text = '';
    endereco?.text = fornecedor['endereco'];
    cep?.text = fornecedor['cep'];
    numEndereco?.text = fornecedor['numEndereco'];
    fornecedor['complemento'] != null
        ? complemento?.text = fornecedor['complemento']
        : complemento?.text = '';
    bairro?.text = fornecedor['bairro'];
    idCidade = fornecedor['FK_idCidade'];
  }

  void updateFornecedor(String idFornecedor) {
    editFornecedor(
      idFornecedor,
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

  void createFornecedor() {
    cadastroFornecedor(
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
