import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/cliente.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

class CamposFormCliente extends StatefulWidget {
  final String? idCliente;
  const CamposFormCliente({super.key, this.idCliente});

  @override
  State<CamposFormCliente> createState() => _CamposFormClienteState();
}

class _CamposFormClienteState extends State<CamposFormCliente> {
  late Cliente cliente;

  @override
  void initState() {
    cliente = Cliente();
    if (widget.idCliente != null) {
      cliente.selectCli(widget.idCliente!);
    }
    super.initState();
  }

  @override
  void dispose() {
    cliente.nome?.dispose();
    cliente.nomeFantasia?.dispose();
    cliente.cpfCnpj?.dispose();
    cliente.telefone?.dispose();
    cliente.email?.dispose();
    cliente.endereco?.dispose();
    cliente.cep?.dispose();
    cliente.numEndereco?.dispose();
    cliente.complemento?.dispose();
    cliente.bairro?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String labelBotao;
    widget.idCliente != null ? labelBotao = 'Salvar' : labelBotao = 'Cadastrar';
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
                  cliente.campoNome(5),
                  const Spacer(),
                  cliente.campoNomeFantasia(5),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoCpfCnpj(3),
                  const Spacer(),
                  cliente.campoTelefone(3),
                  const Spacer(),
                  cliente.campoEmail(4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoCep(3),
                  const Spacer(),
                  cliente.campoEndereco(5),
                  const Spacer(),
                  cliente.campoNumEndereco(2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoBairro(2),
                  const Spacer(),
                  cliente.campoIdCidade(4),
                  const Spacer(),
                  cliente.campoComplemento(4),
                ],
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
                      if (widget.idCliente != null) {
                        if (formKey.currentState!.validate()) {
                          cliente.updateCliente(widget.idCliente!);
                          Timer(
                            const Duration(seconds: 1),
                            () {
                              Navigator.of(context).pop(true);
                            },
                          );
                        }
                      } else if (formKey.currentState!.validate()) {
                        cliente.createCliente();
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
