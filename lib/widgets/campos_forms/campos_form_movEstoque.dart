import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/movEstoque.dart';
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
    final formKey = GlobalKey<FormState>();
    String labelBotao;
    widget.idMovEstoque != null
        ? labelBotao = 'Salvar'
        : labelBotao = 'Cadastrar';
    return FormCadastro(
      formKey: formKey,
      components: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            movEstoque.campoTipo(70),
            const Spacer(flex: 20),
            movEstoque.campoDescricao(150),
            const Spacer(flex: 20),
            movEstoque.campoProduto(70)
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
