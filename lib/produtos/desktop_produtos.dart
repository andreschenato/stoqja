import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/backend/lista_produtos.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';
import 'package:stoque_ja/backend/delete_produto.dart';


// Construção da tela de produtos para desktop

class DesktopProdutos extends StatefulWidget {
  const DesktopProdutos({super.key});

  @override
  State<DesktopProdutos> createState() => _DesktopProdutosState();
}

class _DesktopProdutosState extends State<DesktopProdutos> {
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
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: DesktopAppBar(usuario),
      body: Column(
        children: [
          FunctionButtons(
            onPressedNovo: () async {
              final bool? resultado = await showDialog(
                context: context,
                builder: (context) => const DialogCadastro(tipo: 'Produto',),
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
          Expanded(
            child: ListComponent(
              lista: _prodList,
              dadosCelulas: (Map<String, dynamic> produto) {
                return [
                  DataCell(Text(produto['idProduto'])),
                  DataCell(Text(produto['nomeProduto'])),
                  DataCell(Text(produto['tipo'])),
                  DataCell(Text(produto['valor'])),
                  DataCell(Text(produto['observacao'])),
                  DataCell(Text(produto['quantidade'])),
                ];
              },
              dadosColuna: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Tipo')),
                DataColumn(label: Text('Valor')),
                DataColumn(label: Text('observação')),
                DataColumn(label: Text('categoria')),
                DataColumn(label: Text('Quantidade')),
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
    );
  }
}

