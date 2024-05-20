import 'package:brasil_fields/brasil_fields.dart';
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

  PessoaEmpresa(
      {String? nome,
      String? cpfCnpj,
      String? telefone,
      String? email,
      String? endereco,
      String? cep,
      String? numEndereco,
      String? complemento,
      String? bairro,
      this.idCidade}) {
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

  Widget campoNome(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: nome!,
        warning: 'Insira o nome',
        label: 'Nome',
      ),
    );
  }

  Widget campoCpfCnpj(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        maxL: 18,
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

  Widget campoTelefone(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        inputFormat: [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ],
        maxL: 15,
        controller: telefone!,
        warning: 'Insira o telefone',
        label: 'Telefone',
      ),
    );
  }

  Widget campoEmail(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        txtInput: TextInputType.emailAddress,
        maxL: 100,
        controller: email!,
        label: 'Email',
      ),
    );
  }

  Widget campoEndereco(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 300,
        controller: endereco!,
        warning: 'Insira o endereço',
        label: 'Endereço',
      ),
    );
  }

  Widget campoCep(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        txtInput: TextInputType.number,
        inputFormat: [
          FilteringTextInputFormatter.digitsOnly,
          CepInputFormatter(ponto: false),
        ],
        maxL: 9,
        controller: cep!,
        warning: 'Insira o CEP',
        label: 'CEP',
      ),
    );
  }

  Widget campoNumEndereco(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 10,
        controller: numEndereco!,
        warning: 'Insira o número',
        label: 'Número',
      ),
    );
  }

  Widget campoComplemento(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 500,
        controller: complemento!,
        label: 'Complemento',
      ),
    );
  }

  Widget campoBairro(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 300,
        controller: bairro!,
        warning: 'Insira o bairro',
        label: 'Bairro',
      ),
    );
  }

  Widget campoIdCidade(int flex) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            CitySelect(
              onCitySelected: (selectedCidade) {
                idCidade = selectedCidade!['idCidade'].toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}
