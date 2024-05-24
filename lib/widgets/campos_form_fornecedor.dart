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
    final formKey = GlobalKey<FormState>();
    String labelBotao;
    widget.idFornecedor != null? labelBotao = 'Salvar' : labelBotao = 'Cadastrar';
    return FormCadastro(
      formKey: formKey,
      components: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  fornecedor.campoNome(5),
                  const Spacer(),
                  fornecedor.campoNomeFantasia(5),
                ],
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
          ),
        ),
      ],
    );
  }
}
