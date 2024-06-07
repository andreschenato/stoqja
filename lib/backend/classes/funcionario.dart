import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoque_ja/backend/operations/create/cadastro_funcionario.dart';
import 'package:stoque_ja/backend/classes/pessoa.dart';
import 'package:stoque_ja/backend/operations/select/select_funcionario.dart';
import 'package:stoque_ja/backend/operations/update/update_funcionario.dart';
import 'package:stoque_ja/widgets/date_selector.dart';
import 'package:stoque_ja/widgets/senha_form_field.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class Funcionario extends PessoaEmpresa {
  late TextEditingController? senha;
  late TextEditingController? cargo;
  late TextEditingController? salario;
  late TextEditingController? dataContrato;

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
    super.idCidade,
    String? senha,
    String? cargo,
    String? salario,
    String? dataContrato,
  }) {
    this.senha = TextEditingController(text: senha);
    this.cargo = TextEditingController(text: cargo);
    this.salario = TextEditingController(text: salario);
    this.dataContrato = TextEditingController(text: dataContrato);
  }

  @override
  Widget campoCpfCnpj(int flex){
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        maxL: 14,
        controller: cpfCnpj!,
        inputFormat: [
          FilteringTextInputFormatter.digitsOnly,
          CpfOuCnpjFormatter(),
        ],
        warning: 'Insira o CPF',
        label: 'CPF',
      ),
    );
  }

  Widget campoSenha(int flex) {
    return Expanded(
      flex: flex,
      child: SenhaFormComponent(
        maxL: 25,
        controller: senha!,
        warning: 'Insira a senha',
        label: 'Senha',
      ),
    );
  }

  Widget campoCargo(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: cargo!,
        warning: 'Insira o cargo',
        label: 'Cargo',
      ),
    );
  }

  Widget campoSalario(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 12,
        controller: salario!,
        warning: 'Insira o salário',
        label: 'Salário',
      ),
    );
  }

  Widget campoData(int flex) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 70,
        child: DateSelector(
          controller: dataContrato!,
          label: "Data de contratação",
          warning: "Insira a data de contrato",
        ),
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
    funcionario['email'] != null
        ? email?.text = funcionario['email']
        : email?.text = '';
    salario?.text = funcionario['salario'];
    dataContrato?.text = funcionario['dataContrato'];
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
      salario!.text,
      dataContrato!.text,
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
      salario!.text,
      dataContrato!.text,
      idCidade!,
    );
  }
}
