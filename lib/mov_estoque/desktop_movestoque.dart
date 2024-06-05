import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/movEstoque.dart';
import 'package:stoque_ja/backend/operations/delete/delete_movEstoque.dart';
import 'package:stoque_ja/backend/operations/lista/lista_movEstoque.dart';
import 'package:stoque_ja/backend/operations/lista/lista_produtos.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela de movimentação de estoque para desktop

class DesktopMovEstoque extends StatefulWidget {
  const DesktopMovEstoque({super.key});

  @override
  State<DesktopMovEstoque> createState() => _DesktopMovEstoqueState();
}

class _DesktopMovEstoqueState extends State<DesktopMovEstoque> {
  Future<List<Map<String, dynamic>>>? _prodMovEstoque;
  Future<List<Map<String, dynamic>>>? _prodList;
  String? selectedId;

  void _loadProdMovEstoque() {
    setState(() {
      _prodMovEstoque = listaMovEstoque();
      _prodList = listaProdutos();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProdMovEstoque;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DesktopAppBar(),
      body: Column(
        children: [
          FunctionButtons(
            onPressedNovo: () async {
              final bool? resultado = await showDialog(
                context: context,
                builder: (context) => const DialogCadastro(
                  tipo: 'MovEstoque',
                ),
              );
              if (resultado == true) {
                _loadProdMovEstoque();
              }
            },
            onPressedEdit: () async {
              if (selectedId != null) {
                final bool? resultado = await showDialog(
                  context: context,
                  builder: (context) => DialogCadastro(
                    tipo: 'MovEstoque',
                    idMovEstoque: selectedId,
                  ),
                );
                if (resultado == true) {
                  _loadProdMovEstoque();
                }
              }
            },
            onPressedDelete: () async {
              if (selectedId != null) {
                await deleteMovEstoque(selectedId);
                _loadProdMovEstoque();
              }
            },
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _prodMovEstoque,
              builder: (context, movEstoqueSnapshot) {
                if (movEstoqueSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (movEstoqueSnapshot.hasError) {
                  return const Center(
                      child: Text(
                          'Erro ao carregar dados de movimentação de estoque'));
                } else {
                  final List<Map<String, dynamic>> prodMovEstoque =
                      movEstoqueSnapshot.data ?? [];
                  return FutureBuilder<List<Map<String, dynamic>>>(
                    future: _prodList,
                    builder: (context, prodListSnapshot) {
                      if (prodListSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (prodListSnapshot.hasError) {
                        return const Center(
                            child: Text('Erro ao carregar dados dos produtos'));
                      } else {
                        final List<Map<String, dynamic>> prodListData =
                            prodListSnapshot.data ?? [];
                        final Map<String, Map<String, dynamic>> prodList = {
                          for (var prod in prodListData) prod['idProduto']: prod
                        };

                        return ListComponent(
                          lista: _prodMovEstoque,
                          dadosCelulas: (Map<String, dynamic> movEstoque) {
                            final String idProduto = movEstoque['idProduto'];
                            final Map<String, dynamic> produto =
                                prodList[idProduto] ?? {'Nome': 'Desconhecido'};
                            return [
                              DataCell(Text(movEstoque['idProduto'])),
                              DataCell(Text(produto['Nome'])),
                              DataCell(Text(movEstoque['Tipo'])),
                              DataCell(Text(movEstoque['descrição'])),
                            ];
                          },
                          dadosColuna: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Nome do produto')),
                            DataColumn(label: Text('Tipo')),
                            DataColumn(label: Text('Descrição')),
                          ],
                          onRowSelected: (selectedData) {
                            final String newSelectedId =
                                selectedData['idProduto'];
                            if (newSelectedId != selectedId) {
                              setState(() {
                                selectedId = newSelectedId;
                              });
                            } else {
                              setState(() {
                                selectedId = null;
                              });
                            }
                          },
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
