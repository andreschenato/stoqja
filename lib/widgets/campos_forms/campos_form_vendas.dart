import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/vendas.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

// Componentes do formulário das vendas

class CamposFormVendas extends StatefulWidget {
  final String? idVenda;
  const CamposFormVendas({super.key, this.idVenda});

  @override
  State<CamposFormVendas> createState() => _CamposFormVendasState();
}

class _CamposFormVendasState extends State<CamposFormVendas> {
  late VendasOrdens vendasOrdens;

  @override
  void initState() {
    vendasOrdens = VendasOrdens();
    if (widget.idVenda != null) {
      // vendasOrdens.selectProd(widget.idVenda!);
    }
    super.initState();
  }

  @override
  void dispose() {
    vendasOrdens.descricao?.dispose();
    vendasOrdens.laudo?.dispose();
    vendasOrdens.quantidade?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String labelBotao = 'Salvar';
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      width: MediaQuery.of(context).size.width / 1.2,
      child: FormCadastro(
        formKey: formKey,
        components: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              vendasOrdens.campoFuncionario(5),
              const Spacer(),
              vendasOrdens.campoCliente(5),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              vendasOrdens.campoItensVenda(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              vendasOrdens.campoDesc(5),
              const Spacer(),
              vendasOrdens.campoLaudo(5),
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
                  if (widget.idVenda != null) {
                    if (formKey.currentState!.validate()) {
                      // vendasOrdens.updateProd(widget.idVenda!);
                      Timer(
                        const Duration(seconds: 1),
                        () {
                          Navigator.of(context).pop(true);
                        },
                      );
                    }
                  } else if (formKey.currentState!.validate()) {
                    // vendasOrdens.createProd();
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
    );
  }
}