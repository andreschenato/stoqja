import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/cadastro_funcionario.dart';
import 'package:stoque_ja/backend/pessoa.dart';
import 'package:stoque_ja/backend/select_funcionario.dart';
import 'package:stoque_ja/backend/update_funcionario.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class Funcionario extends PessoaEmpresa {
  late TextEditingController? senha;
  late TextEditingController? cargo;

  Funcionario({
    super.nome,
    super.cpfCnpj,
    super.telefone,
    super.email,
    super.endereco,
    super.cep,
    super.numEndereco,
    super.complemento,
    super.bairro,
    String? senha,
    String? cargo,
  }) {
    this.senha = TextEditingController(text: senha);
    this.cargo = TextEditingController(text: cargo);
  }

  Widget campoSenha() {
    return Expanded(
      flex: 4,
      child: TextFormComponent(
        maxL: 25,
        controller: senha!,
        warning: 'Insira a senha',
        label: 'Senha',
      ),
    );
  }

  Widget campoCargo() {
    return Expanded(
      flex: 3,
      child: TextFormComponent(
        maxL: 200,
        controller: cargo!,
        warning: 'Insira o cargo',
        label: 'Cargo',
      ),
    );
  }

  // Atualiza as informações das variáveis com as informações do usuário selecionado

  void selectFunc(String idFuncionario) async {
    Map<String, dynamic> funcionario = await selectFuncionario(idFuncionario);
    nome?.text = funcionario['nome'];
    cargo?.text = funcionario['cargo'];
    cpfCnpj?.text = funcionario['cpf'];
    telefone?.text = funcionario['telefone'];
    senha?.text = funcionario['senha'];
    cep?.text = funcionario['cep'];
    endereco?.text = funcionario['endereco'];
    numEndereco?.text = funcionario['numEndereco'];
    funcionario['complemento'] != null
        ? complemento?.text = funcionario['complemento']
        : complemento?.text = '';
    bairro?.text = funcionario['bairro'];
    funcionario['email'] !=
        null ? email?.text = funcionario['email'] : email?.text = '';
    idCidade = funcionario['FK_idCidade'];
  }

  void updateFunc(String idFuncionario) {
    editFuncionario(
      idFuncionario,
      nome!.text,
      senha!.text,
      cargo!.text,
      cpfCnpj!.text,
      telefone!.text,
      email!.text,
      cep!.text,
      endereco!.text,
      numEndereco!.text,
      complemento!.text,
      bairro!.text,
      idCidade!,
    );
  }

  void createFunc() {
    cadastroFuncionario(
      nome!.text,
      senha!.text,
      cargo!.text,
      cpfCnpj!.text,
      telefone!.text,
      email!.text,
      cep!.text,
      endereco!.text,
      numEndereco!.text,
      complemento!.text,
      bairro!.text,
      idCidade!,
    );
  }
}
