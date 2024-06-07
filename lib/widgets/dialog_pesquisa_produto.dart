import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/produto.dart';
import 'package:stoque_ja/backend/classes/vendas.dart';
import 'package:stoque_ja/backend/operations/lista/lista_produtos.dart';
import 'package:stoque_ja/widgets/list_component.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class DialogPesquisaProduto extends StatefulWidget {
  const DialogPesquisaProduto({super.key});

  @override
  State<DialogPesquisaProduto> createState() => _DialogPesquisaProdutoState();
}

class _DialogPesquisaProdutoState extends State<DialogPesquisaProduto> {
  Future<List<Map<String, dynamic>>>? _prodList;
  String? idProduto;
  late Produto produto;
  late VendasOrdens item;

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
    Size size = MediaQuery.of(context).size;
    final TextEditingController pesquisa = TextEditingController();
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: TextFormComponent(
                                  controller: pesquisa,
                                  maxLines: 1,
                                  label: 'Pesquise um produto',
                                  onEnter: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                                  dadosCelulas: (Map<String, dynamic> produto) {
                                    return [
                                      DataCell(Text(produto['idProduto'])),
                                      DataCell(Text(produto['nomeProduto'])),
                                      DataCell(Text(produto['categoria'])),
                                      DataCell(Text(produto['valor'])),
                                      DataCell(Text(produto['quantidade'])),
                                    ];
                                  },
                                  dadosColuna: const [
                                    DataColumn(
                                      label: Text(
                                        'ID',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nome',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Categoria',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Valor',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Quantidade',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onRowSelected: (selectedData) async {
                                    final String newSelectedId =
                                        selectedData['idProduto'];
                                    if (newSelectedId != idProduto) {
                                      setState(() {
                                        idProduto = selectedData['idProduto'];
                                      });
                                      await produto.selectProd(idProduto!);
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    item.campoQuantidadeItem(2),
                                    const Spacer(),
                                    produto.campoValor(5),
                                    const Spacer(),
                                    item.campoValorItem(4),
                                  ],
                                ),
                              ],
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
