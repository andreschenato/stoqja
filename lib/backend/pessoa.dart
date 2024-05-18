import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoque_ja/widgets/cidade_selector.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

// Classe abstrata de pessoa e empresa, é usada pelo funcionario, cliente e fornecedor

abstract class PessoaEmpresa {
  late TextEditingController? nome;
  late TextEditingController? cpfCnpj;
  late TextEditingController? telefone;
  late TextEditingController? email;
  late TextEditingController? endereco;
  late TextEditingController? cep;
  late TextEditingController? numEndereco;
  late TextEditingController? complemento;
  late TextEditingController? bairro;
  late String? idCidade;

  PessoaEmpresa({
    String? nome,
    String? cpfCnpj,
    String? telefone,
    String? email,
    String? endereco,
    String? cep,
    String? numEndereco,
    String? complemento,
    String? bairro,
  }) {
    this.nome = TextEditingController(text: nome);
    this.cpfCnpj = TextEditingController(text: cpfCnpj);
    this.telefone = TextEditingController(text: telefone);
    this.email = TextEditingController(text: email);
    this.endereco = TextEditingController(text: endereco);
    this.cep = TextEditingController(text: cep);
    this.numEndereco = TextEditingController(text: numEndereco);
    this.complemento = TextEditingController(text: complemento);
    this.bairro = TextEditingController(text: bairro);
  }

  Widget campoNome() {
    return Expanded(
      flex: 7,
      child: TextFormComponent(
        maxL: 200,
        controller: nome!,
        warning: 'Insira o nome',
        label: 'Nome',
      ),
    );
  }

  Widget campoCpfCnpj() {
    return Expanded(
      flex: 3,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        inputFormat: [FilteringTextInputFormatter.digitsOnly],
        maxL: 11,
        controller: cpfCnpj!,
        warning: 'Insira o CPF',
        label: 'CPF',
      ),
    );
  }

  Widget campoTelefone() {
    return Expanded(
      flex: 3,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        inputFormat: [FilteringTextInputFormatter.digitsOnly],
        maxL: 11,
        controller: telefone!,
        warning: 'Insira o telefone',
        label: 'Telefone',
      ),
    );
  }

  Widget campoEmail() {
    return Expanded(
      child: TextFormComponent(
        txtInput: TextInputType.emailAddress,
        maxL: 100,
        controller: email!,
        label: 'Email',
      ),
    );
  }

  Widget campoEndereco() {
    return Expanded(
      flex: 7,
      child: TextFormComponent(
        maxL: 300,
        controller: endereco!,
        warning: 'Insira o endereço',
        label: 'Endereço',
      ),
    );
  }

  Widget campoCep() {
    return Expanded(
      flex: 2,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        inputFormat: [FilteringTextInputFormatter.digitsOnly],
        maxL: 8,
        controller: cep!,
        warning: 'Insira o CEP',
        label: 'CEP',
      ),
    );
  }

  Widget campoNumEndereco() {
    return Expanded(
      flex: 2,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        inputFormat: [FilteringTextInputFormatter.digitsOnly],
        maxL: 5,
        controller: numEndereco!,
        warning: 'Insira o número',
        label: 'Número',
      ),
    );
  }

  Widget campoComplemento() {
    return Expanded(
      flex: 4,
      child: TextFormComponent(
        maxL: 500,
        controller: complemento!,
        label: 'Complemento',
      ),
    );
  }

  Widget campoBairro() {
    return Expanded(
      flex: 3,
      child: TextFormComponent(
        maxL: 300,
        controller: bairro!,
        warning: 'Insira o bairro',
        label: 'Bairro',
      ),
    );
  }

  Widget campoIdCidade() {
    return Expanded(
      flex: 3,
      child: CitySelect(
        onCitySelected: (selectedCidade) {
          idCidade = selectedCidade!['idCidade'].toString();
        },
      ),
    );
  }
}
