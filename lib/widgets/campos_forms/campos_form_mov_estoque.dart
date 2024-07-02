import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/mov_estoque.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

// Componentes do formulário da MovEstoque

class CamposFormMovEstoque extends StatefulWidget {
  final String? idMovEstoque;
  const CamposFormMovEstoque({super.key, this.idMovEstoque});

  @override
  State<CamposFormMovEstoque> createState() => _CamposFormMovEstoqueState();
}

class _CamposFormMovEstoqueState extends State<CamposFormMovEstoque> {
  late MovEstoque movEstoque;
  static final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    movEstoque = MovEstoque();
    if (widget.idMovEstoque != null) {
      movEstoque.selectmovEstoque(widget.idMovEstoque!);
    }
    super.initState();
  }

  @override
  void dispose() {
    movEstoque.descricao?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 650 ? true : false;
    String labelBotao;
    widget.idMovEstoque != null
        ? labelBotao = 'Salvar'
        : labelBotao = 'Cadastrar';
    return FormCadastro(
      formKey: formKey,
      components: isMobile
          ? [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  movEstoque.campoTipo(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  movEstoque.campoDescricao(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  movEstoque.campoProduto(10),
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
                      if (widget.idMovEstoque != null) {
                        if (formKey.currentState!.validate()) {
                          movEstoque.updateMovEstoque(widget.idMovEstoque!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        movEstoque.createMovEstoque();
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
                  movEstoque.campoTipo(10),
                  const Spacer(),
                  movEstoque.campoProduto(10)
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  movEstoque.campoDescricao(10),
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
                      if (widget.idMovEstoque != null) {
                        if (formKey.currentState!.validate()) {
                          movEstoque.updateMovEstoque(widget.idMovEstoque!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        movEstoque.createMovEstoque();
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
