import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/vendas.dart';
import 'package:stoque_ja/backend/operations/delete/delete_item_venda.dart';
import 'package:stoque_ja/backend/operations/lista/lista_itens_venda.dart';
import 'package:stoque_ja/backend/operations/select/select_venda.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/dialog_pesquisa_produto.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Componentes do formulário das vendas

class CamposFormVendas extends StatefulWidget {
  final String? idVenda;
  const CamposFormVendas({super.key, this.idVenda});

  @override
  State<CamposFormVendas> createState() => _CamposFormVendasState();
}

class _CamposFormVendasState extends State<CamposFormVendas> {
  Future<List<Map<String, dynamic>>>? _itensList;
  String? selectedId;
  late VendasOrdens vendasOrdens;

  void _loadItens() {
    setState(() {
      _itensList = listaItensVenda(widget.idVenda!);
    });
  }

  atualizaValortotal(String idVenda) async {
    Map<String, dynamic> venda = await selectVenda(idVenda);
    setState(() {
      vendasOrdens.valorTotal = venda['valorTotal'];
    });
  }

  @override
  void initState() {
    vendasOrdens = VendasOrdens();
    vendasOrdens.selecionaVenda(widget.idVenda!);
    atualizaValortotal(widget.idVenda!);
    super.initState();
    _loadItens();
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
              vendasOrdens.campoStatus(10),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Itens da venda:',
                              textScaler: TextScaler.linear(1.3),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: buttonTheme,
                              onPressed: () async {
                                final bool? resultado = await showDialog(
                                  context: context,
                                  builder: (context) => DialogPesquisaProduto(
                                    idVenda: widget.idVenda!,
                                  ),
                                );
                                if (resultado == true) {
                                  _loadItens();
                                  atualizaValortotal(widget.idVenda!);
                                }
                              },
                              child: const Text('Adicionar produto'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              style: buttonTheme,
                              onPressed: () async {
                                if (selectedId != null) {
                                  await deleteItemVenda(
                                      selectedId!, widget.idVenda!);
                                  _loadItens();
                                  atualizaValortotal(widget.idVenda!);
                                }
                              },
                              child: const Text('Remover produto'),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4.8,
                              width: MediaQuery.of(context).size.width / 1.31,
                              child: ListComponent(
                                lista: _itensList,
                                dadosCelulas: (Map<String, dynamic> itemVenda) {
                                  return [
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                50,
                                        child: Text(itemVenda['FK_idProduto']),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        child: Text(itemVenda['nomeProduto']),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child:
                                            Text("R\$ ${itemVenda['valor']}"),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                20,
                                        child: Text(itemVenda['quantidade']),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: Text(
                                            "R\$ ${itemVenda['valorItens']}"),
                                      ),
                                    ),
                                  ];
                                },
                                dadosColuna: const [
                                  DataColumn(
                                    label: Text(
                                      'ID',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Nome',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Valor',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Quantidade',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Valor dos Itens',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                                onRowSelected: (selectedData) {
                                  final String newSelectedId =
                                      selectedData['idItensVenda'];
                                  if (newSelectedId != selectedId) {
                                    selectedId = selectedData['idItensVenda'];
                                  } else {
                                    selectedId = null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Valor total:',
                              textScaler: TextScaler.linear(1.3),
                            ),
                            const Spacer(),
                            Text(
                              'R\$ ${vendasOrdens.valorTotal}',
                              textScaler: const TextScaler.linear(1.3),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
                      vendasOrdens.updateVenda(widget.idVenda!);
                      Timer(
                        const Duration(seconds: 1),
                        () {
                          Navigator.of(context).pop(true);
                        },
                      );
                    }
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
