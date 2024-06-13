import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/delete/delete_produto.dart';
import 'package:stoque_ja/backend/operations/lista/lista_produtos.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da produtos de estoque para mobile

class MobileProdutos extends StatefulWidget {
  const MobileProdutos({super.key});

  @override
  State<MobileProdutos> createState() => _MobileProdutosState();
}

class _MobileProdutosState extends State<MobileProdutos> {
  Future<List<Map<String, dynamic>>>? _prodList;
  String? selectedId;

  void _loadProdList() {
    setState(() {
      _prodList = listaProdutos();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProdList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerComponent(
        tela: 'Produtos',
      ),
      appBar: const CustomAppBar(),
      body: Wrap(
        direction: Axis.horizontal,
        children: [
          Row(
            children: [
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1.5,
                      child: FunctionButtons(
                        onPressedNovo: () async {
                          final bool? resultado = await showDialog(
                            context: context,
                            builder: (context) => const DialogCadastro(
                              tipo: 'Produto',
                            ),
                          );
                          if (resultado == true) {
                            _loadProdList();
                          }
                        },
                        onPressedEdit: () async {
                          if (selectedId != null) {
                            final bool? resultado = await showDialog(
                              context: context,
                              builder: (context) => DialogCadastro(
                                tipo: 'Produto',
                                idProduto: selectedId,
                              ),
                            );
                            if (resultado == true) {
                              _loadProdList();
                            }
                          }
                        },
                        onPressedDelete: () async {
                          if (selectedId != null) {
                            await deleteProduto(selectedId);
                            _loadProdList();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                    (kToolbarHeight * 2) -
                    48),
                width: MediaQuery.of(context).size.width,
                child: ListComponent(
                  lista: _prodList,
                  dadosCelulas: (Map<String, dynamic> produto) {
                    return [
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                          child: Text(produto['idProduto']),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            produto['nomeProduto'],
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "R\$ ${produto['valor']}",
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                          child: Text(produto['quantidade']),
                        ),
                      ),
                    ];
                  },
                  dadosColuna: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Nome')),
                    DataColumn(label: Text('Valor')),
                    DataColumn(label: Text('Qntd.')),
                  ],
                  onRowSelected: (selectedData) {
                    final String newSelectedId = selectedData['idProduto'];
                    if (newSelectedId != selectedId) {
                      selectedId = selectedData['idProduto'];
                    } else {
                      selectedId = null;
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
