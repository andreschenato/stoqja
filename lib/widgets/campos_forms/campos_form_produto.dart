import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/produto.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

// Componentes do formulário do produto

class CamposFormProduto extends StatefulWidget {
  final String? idProduto;
  const CamposFormProduto({super.key, this.idProduto});

  @override
  State<CamposFormProduto> createState() => _CamposFormProdutoState();
}

class _CamposFormProdutoState extends State<CamposFormProduto> {
  late Produto produto;
  static final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    produto = Produto();
    if (widget.idProduto != null) {
      produto.selectProd(widget.idProduto!);
    }
    super.initState();
  }

  @override
  void dispose() {
    produto.nomeProduto?.dispose();
    produto.tipo?.dispose();
    produto.valor?.dispose();
    produto.observacao?.dispose();
    produto.categoria?.dispose();
    produto.quantidade?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 650 ? true : false;
    String labelBotao;
    widget.idProduto != null ? labelBotao = 'Salvar' : labelBotao = 'Cadastrar';
    return FormCadastro(
      formKey: formKey,
      components: isMobile
          ? [
              Row(
                children: [
                  produto.campoNomeProduto(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  produto.campoCategoria(5),
                  const Spacer(),
                  produto.campoTipo(5),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  produto.campoValor(5),
                  const Spacer(),
                  produto.campoQuantidade(5),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  produto.campoObservacao(10),
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
                      if (widget.idProduto != null) {
                        if (formKey.currentState!.validate()) {
                          produto.updateProd(widget.idProduto!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        produto.createProd();
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
                  produto.campoNomeProduto(5),
                  const Spacer(),
                  produto.campoTipo(3),
                  const Spacer(),
                  produto.campoObservacao(2),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  produto.campoCategoria(3),
                  const Spacer(),
                  produto.campoValor(3),
                  const Spacer(),
                  produto.campoQuantidade(5),
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
                      if (widget.idProduto != null) {
                        if (formKey.currentState!.validate()) {
                          produto.updateProd(widget.idProduto!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        produto.createProd();
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
