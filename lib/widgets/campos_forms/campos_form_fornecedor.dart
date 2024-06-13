import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/fornecedor.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

class CamposFormFornecedor extends StatefulWidget {
  final String? idFornecedor;
  const CamposFormFornecedor({super.key, this.idFornecedor});

  @override
  State<CamposFormFornecedor> createState() => _CamposFormFornecedorState();
}

class _CamposFormFornecedorState extends State<CamposFormFornecedor> {
  late Fornecedor fornecedor;
  static final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fornecedor = Fornecedor();
    if (widget.idFornecedor != null) {
      fornecedor.selectForn(widget.idFornecedor!);
    }
    super.initState();
  }

  @override
  void dispose() {
    fornecedor.nome?.dispose();
    fornecedor.nomeFantasia?.dispose();
    fornecedor.cpfCnpj?.dispose();
    fornecedor.telefone?.dispose();
    fornecedor.email?.dispose();
    fornecedor.endereco?.dispose();
    fornecedor.cep?.dispose();
    fornecedor.numEndereco?.dispose();
    fornecedor.complemento?.dispose();
    fornecedor.bairro?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 650 ? true : false;
    String labelBotao;
    widget.idFornecedor != null
        ? labelBotao = 'Salvar'
        : labelBotao = 'Cadastrar';
    return FormCadastro(
      formKey: formKey,
      components: isMobile
          ? [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoNome(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoNomeFantasia(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoCpfCnpj(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoEmail(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoTelefone(6),
                  const Spacer(),
                  fornecedor.campoCep(4),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoEndereco(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoNumEndereco(4),
                  const Spacer(),
                  fornecedor.campoBairro(6),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoIdCidade(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoComplemento(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: buttonTheme,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: buttonTheme,
                    onPressed: () {
                      if (widget.idFornecedor != null) {
                        if (formKey.currentState!.validate()) {
                          fornecedor.updateFornecedor(widget.idFornecedor!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        fornecedor.createFornecedor();
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
            ]
          : [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoNome(5),
                  const Spacer(),
                  fornecedor.campoNomeFantasia(5),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoCpfCnpj(3),
                  const Spacer(),
                  fornecedor.campoTelefone(3),
                  const Spacer(),
                  fornecedor.campoEmail(4),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoCep(3),
                  const Spacer(),
                  fornecedor.campoEndereco(5),
                  const Spacer(),
                  fornecedor.campoNumEndereco(2),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoBairro(2),
                  const Spacer(),
                  fornecedor.campoIdCidade(4),
                  const Spacer(),
                  fornecedor.campoComplemento(4),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: buttonTheme,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: buttonTheme,
                    onPressed: () {
                      if (widget.idFornecedor != null) {
                        if (formKey.currentState!.validate()) {
                          fornecedor.updateFornecedor(widget.idFornecedor!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        fornecedor.createFornecedor();
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
    );
  }
}
