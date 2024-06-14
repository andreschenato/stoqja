import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/produto.dart';
import 'package:stoque_ja/backend/classes/vendas.dart';
import 'package:stoque_ja/backend/operations/lista/lista_produtos.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';
import 'package:stoque_ja/widgets/list_component.dart';

class DialogPesquisaProduto extends StatefulWidget {
  final String idVenda;
  const DialogPesquisaProduto({super.key, required this.idVenda});

  @override
  State<DialogPesquisaProduto> createState() => _DialogPesquisaProdutoState();
}

class _DialogPesquisaProdutoState extends State<DialogPesquisaProduto> {
  Future<List<Map<String, dynamic>>>? _prodList;
  String? idProduto;
  String? idItem;
  late Produto produto;
  late VendasOrdens item;
  static final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    item = VendasOrdens();
    produto = Produto();
    if (idProduto != null) {
      produto.selectProd(idProduto!);
    }
    super.initState();
    _loadProdList();
    item.quantidade?.addListener(_updateValorItens);
  }

  void _updateValorItens() {
    item.atualizarValItens(produto.getValorProduto());
  }

  void _loadProdList() {
    setState(() {
      _prodList = listaProdutos();
    });
  }

  @override
  void dispose() {
    item.quantidade?.removeListener(_updateValorItens);
    item.quantidade?.dispose();
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
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
          constraints: BoxConstraints(
            maxHeight: size.height / 1.4,
            maxWidth: size.width / 1.4,
            minHeight: size.height / 2,
          ),
          child: SizedBox(
            height: size.height / 1.4,
            width: size.width / 1.4,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: isMobile
                      ? [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        width: 1,
                                      )),
                                      height: size.height / 3.6,
                                      width: size.width / 1.6,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          SizedBox(
                                            width: size.width * 1.5,
                                            child: ListComponent(
                                              lista: _prodList,
                                              dadosCelulas:
                                                  (Map<String, dynamic>
                                                      produto) {
                                                return [
                                                  DataCell(
                                                    Center(
                                                      child: SizedBox(
                                                        width: size.width / 100,
                                                        child: Text(produto[
                                                            'idProduto']),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Center(
                                                      child: SizedBox(
                                                        width: size.width / 4,
                                                        child: Text(
                                                          produto[
                                                              'nomeProduto'],
                                                          textScaler:
                                                              const TextScaler
                                                                  .linear(0.9),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Center(
                                                      child: SizedBox(
                                                        width: size.width / 6,
                                                        child: Text(produto[
                                                            'categoria']),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Center(
                                                      child: SizedBox(
                                                        child: Text(
                                                            "R\$ ${produto['valor']}"),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Center(
                                                      child: SizedBox(
                                                        child: Text(produto[
                                                            'quantidade']),
                                                      ),
                                                    ),
                                                  ),
                                                ];
                                              },
                                              dadosColuna: const [
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'ID',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Nome',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Categoria',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Valor',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Quantidade',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              onRowSelected:
                                                  (selectedData) async {
                                                final String newSelectedId =
                                                    selectedData['idProduto'];
                                                if (newSelectedId !=
                                                    idProduto) {
                                                  setState(() {
                                                    idProduto = selectedData[
                                                        'idProduto'];
                                                  });
                                                  await produto
                                                      .selectProd(idProduto!);
                                                  setState(() {
                                                    item.quantidade?.text = '1';
                                                    item.atualizarValItens(
                                                        produto
                                                            .getValorProduto());
                                                  });
                                                } else {
                                                  setState(() {
                                                    idProduto = null;
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Visibility(
                                  visible: idProduto == null ? false : true,
                                  child: SizedBox(
                                    height: size.height / 3,
                                    width: size.width,
                                    child: FormCadastro(
                                      formKey: formKey,
                                      components: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            produto.campoNomeProduto(10),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            produto.campoNomeProduto(5),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            item.campoQuantidadeItem(5),
                                            const Spacer(),
                                            produto.campoValor(5),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            item.campoValorItem(10),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              style: buttonTheme,
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: const Text('Cancelar'),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            ElevatedButton(
                                              style: buttonTheme,
                                              onPressed: () {
                                                if (idItem != null) {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    // vendasOrdens.updateProd(widget.idVenda!);
                                                    Timer(
                                                      const Duration(
                                                          seconds: 1),
                                                      () {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      },
                                                    );
                                                  }
                                                } else if (formKey.currentState!
                                                    .validate()) {
                                                  item.criaItem(widget.idVenda,
                                                      idProduto!);
                                                  Timer(
                                                    const Duration(seconds: 1),
                                                    () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                  );
                                                }
                                              },
                                              child: const Text('Salvar'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                      : [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        width: 1,
                                      )),
                                      height: size.height / 3.6,
                                      width: size.width / 1.5,
                                      child: ListComponent(
                                        lista: _prodList,
                                        dadosCelulas:
                                            (Map<String, dynamic> produto) {
                                          return [
                                            DataCell(
                                              SizedBox(
                                                width: size.width / 100,
                                                child:
                                                    Text(produto['idProduto']),
                                              ),
                                            ),
                                            DataCell(
                                              SizedBox(
                                                width: size.width / 10,
                                                child: Text(
                                                  produto['nomeProduto'],
                                                  textScaler:
                                                      const TextScaler.linear(
                                                          0.9),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Center(
                                                child: SizedBox(
                                                  width: size.width / 15,
                                                  child: Text(
                                                      produto['categoria']),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Center(
                                                child: SizedBox(
                                                  child: Text(
                                                      "R\$ ${produto['valor']}"),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Center(
                                                child: SizedBox(
                                                  child: Text(
                                                      produto['quantidade']),
                                                ),
                                              ),
                                            ),
                                          ];
                                        },
                                        dadosColuna: const [
                                          DataColumn(
                                            label: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'ID',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Nome',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Categoria',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Valor',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Quantidade',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        onRowSelected: (selectedData) async {
                                          final String newSelectedId =
                                              selectedData['idProduto'];
                                          if (newSelectedId != idProduto) {
                                            setState(() {
                                              idProduto =
                                                  selectedData['idProduto'];
                                            });
                                            await produto
                                                .selectProd(idProduto!);
                                            setState(() {
                                              item.quantidade?.text = '1';
                                              item.atualizarValItens(
                                                  produto.getValorProduto());
                                            });
                                          } else {
                                            setState(() {
                                              idProduto = null;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Visibility(
                                  visible: idProduto == null ? false : true,
                                  child: SizedBox(
                                    height: size.height / 3,
                                    width: size.width,
                                    child: FormCadastro(
                                      formKey: formKey,
                                      components: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            produto.campoNomeProduto(5),
                                            const Spacer(),
                                            produto.campoCategoria(5),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            item.campoQuantidadeItem(3),
                                            const Spacer(),
                                            produto.campoValor(4),
                                            const Spacer(),
                                            item.campoValorItem(4),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              style: buttonTheme,
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: const Text('Cancelar'),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            ElevatedButton(
                                              style: buttonTheme,
                                              onPressed: () {
                                                if (idItem != null) {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    // vendasOrdens.updateProd(widget.idVenda!);
                                                    Timer(
                                                      const Duration(
                                                          seconds: 1),
                                                      () {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      },
                                                    );
                                                  }
                                                } else if (formKey.currentState!
                                                    .validate()) {
                                                  item.criaItem(widget.idVenda,
                                                      idProduto!);
                                                  Timer(
                                                    const Duration(seconds: 1),
                                                    () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                  );
                                                }
                                              },
                                              child: const Text('Salvar'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                ),
              ),
            ),
          )),
    );
  }
}
