import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/cliente.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

class CamposFormCliente extends StatefulWidget {
  final String? idCliente;
  const CamposFormCliente({super.key, this.idCliente});

  @override
  State<CamposFormCliente> createState() => _CamposFormClienteState();
}

class _CamposFormClienteState extends State<CamposFormCliente> {
  late Cliente cliente;
  static final formKey = GlobalKey<FormState>();

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
    bool isMobile = MediaQuery.of(context).size.width < 650 ? true : false;
    String labelBotao;
    widget.idCliente != null ? labelBotao = 'Salvar' : labelBotao = 'Cadastrar';
    return FormCadastro(
      formKey: formKey,
      components: isMobile
          ? [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoNome(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoNomeFantasia(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoCpfCnpj(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoEmail(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoTelefone(6),
                  const Spacer(),
                  cliente.campoCep(4),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoEndereco(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoNumEndereco(4),
                  const Spacer(),
                  cliente.campoBairro(6),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoIdCidade(10),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoComplemento(10),
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
            ]
          : [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cliente.campoNome(5),
                  const Spacer(),
                  cliente.campoNomeFantasia(5),
                ],
              ),
              const SizedBox(
                height: 25,
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
              const SizedBox(
                height: 25,
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
              const SizedBox(
                height: 25,
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
    );
  }
}
