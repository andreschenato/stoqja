import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoque_ja/backend/cadastro_funcionario.dart';
import 'package:stoque_ja/backend/select_funcionario.dart';
import 'package:stoque_ja/backend/update_funcionario.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';
import 'package:stoque_ja/widgets/cidade_selector.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

// Dialog de cadastro do funcionário, implementa o formulario de cadastro

class DialogCadastroFuncionario extends StatefulWidget {
  final String? idFuncionario;
  const DialogCadastroFuncionario({super.key, this.idFuncionario});

  @override
  State<DialogCadastroFuncionario> createState() =>
      _DialogCadastroFuncionarioState();
}

class _DialogCadastroFuncionarioState extends State<DialogCadastroFuncionario> {
  String? idCidade;
  final nomeController = TextEditingController();
  final cargoController = TextEditingController();
  final cpfController = TextEditingController();
  final telController = TextEditingController();
  final senhaController = TextEditingController();
  final cepController = TextEditingController();
  final endrcController = TextEditingController();
  final numEndrcController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final emailController = TextEditingController();

  void selectFunc() async {
    Map<String, dynamic> funcionario =
        await selectFuncionario(widget.idFuncionario!);
    nomeController.text = funcionario['nome'];
    cargoController.text = funcionario['cargo'];
    cpfController.text = funcionario['cpf'];
    telController.text = funcionario['telefone'];
    senhaController.text = funcionario['senha'];
    cepController.text = funcionario['cep'];
    endrcController.text = funcionario['endereco'];
    numEndrcController.text = funcionario['numEndereco'];
    funcionario['complemento'] != null
        ? complementoController.text = funcionario['complemento']
        : complementoController.text = '';
    bairroController.text = funcionario['bairro'];
    funcionario['email'] != null
        ? emailController.text = funcionario['email']
        : emailController.text = '';
    idCidade = funcionario['FK_idCidade'];
  }

  @override
  void dispose() {
    nomeController.dispose();
    cargoController.dispose();
    cpfController.dispose();
    telController.dispose();
    senhaController.dispose();
    cepController.dispose();
    endrcController.dispose();
    numEndrcController.dispose();
    complementoController.dispose();
    bairroController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    String labelBotao;
    if (widget.idFuncionario != null) {
      labelBotao = 'Salvar';
      selectFunc();
    } else {
      labelBotao = 'Cadastrar';
    }
    return Dialog(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: size.height / 1.2,
          maxWidth: size.width / 1.2,
          minHeight: size.height / 2,
        ),
        child: FormCadastro(
          formKey: formKey,
          components: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 7,
                  child: TextFormComponent(
                    maxL: 200,
                    controller: nomeController,
                    warning: 'Insira o nome',
                    label: 'Nome',
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: TextFormComponent(
                    maxL: 200,
                    controller: cargoController,
                    warning: 'Insira o cargo',
                    label: 'Cargo',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormComponent(
                    txtInput: TextInputType.number,
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    maxL: 11,
                    controller: cpfController,
                    warning: 'Insira o CPF',
                    label: 'CPF',
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: TextFormComponent(
                    txtInput: TextInputType.number,
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    maxL: 11,
                    controller: telController,
                    warning: 'Insira o telefone',
                    label: 'Telefone',
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: TextFormComponent(
                    maxL: 25,
                    controller: senhaController,
                    warning: 'Insira a senha',
                    label: 'Senha',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextFormComponent(
                    txtInput: TextInputType.emailAddress,
                    maxL: 100,
                    controller: emailController,
                    label: 'Email',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormComponent(
                    txtInput: TextInputType.number,
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    maxL: 8,
                    controller: cepController,
                    warning: 'Insira o CEP',
                    label: 'CEP',
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 7,
                  child: TextFormComponent(
                    maxL: 300,
                    controller: endrcController,
                    warning: 'Insira o endereço',
                    label: 'Endereço',
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: TextFormComponent(
                    txtInput: TextInputType.number,
                    inputFormat: [FilteringTextInputFormatter.digitsOnly],
                    maxL: 5,
                    controller: numEndrcController,
                    warning: 'Insira o número',
                    label: 'Número',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormComponent(
                    maxL: 300,
                    controller: bairroController,
                    warning: 'Insira o bairro',
                    label: 'Bairro',
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 80,
                    child: CitySelect(
                      onCitySelected: (selectedCidade) {
                        idCidade = selectedCidade?['idCidade'].toString();
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: TextFormComponent(
                    maxL: 500,
                    controller: complementoController,
                    label: 'Complemento',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancelar'),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.idFuncionario != null) {
                      if (formKey.currentState!.validate()) {
                        editFuncionario(
                          widget.idFuncionario.toString(),
                          nomeController.text,
                          senhaController.text,
                          cargoController.text,
                          cpfController.text,
                          telController.text,
                          emailController.text,
                          cepController.text,
                          endrcController.text,
                          numEndrcController.text,
                          complementoController.text,
                          bairroController.text,
                          idCidade.toString(),
                        );
                        Timer(
                          const Duration(seconds: 1),
                          () {
                            Navigator.of(context).pop(true);
                          },
                        );
                      }
                    }
                    else if (formKey.currentState!.validate()) {
                      cadastroFuncionario(
                        nomeController.text,
                        senhaController.text,
                        cargoController.text,
                        cpfController.text,
                        telController.text,
                        emailController.text,
                        cepController.text,
                        endrcController.text,
                        numEndrcController.text,
                        complementoController.text,
                        bairroController.text,
                        idCidade.toString(),
                      );
                      Timer(
                        const Duration(seconds: 1),
                        () {
                          Navigator.of(context).pop(true);
                        },
                      );
                    }
                  },
                  child: Text(labelBotao),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
