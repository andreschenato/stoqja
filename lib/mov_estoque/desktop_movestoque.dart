import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/delete/delete_movEstoque.dart';
import 'package:stoque_ja/backend/operations/lista/lista_movEstoque.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
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
  String? selectedId;

  void _loadprodMovEstoque() {
    setState(() {
      _prodMovEstoque = listaMovEstoque();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadprodMovEstoque();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
                _loadprodMovEstoque();
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
                  _loadprodMovEstoque();
                }
              }
            },
            onPressedDelete: () async {
              if (selectedId != null) {
                await deleteMovEstoque(selectedId);
                _loadprodMovEstoque();
              }
            },
          ),
          Expanded(
            child: ListComponent(
              lista: _prodMovEstoque,
              dadosCelulas: (Map<String, dynamic> movEstoque) {
                return [
                  DataCell(Text(movEstoque['idMovEstoque'])),
                  DataCell(Text(movEstoque['descricao'])),
                  DataCell(Text(movEstoque['nomeProduto'])),
                  DataCell(Text(movEstoque['tipo'])),
                ];
              },
              dadosColuna: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Descrição')),               
                DataColumn(label: Text('Nome do Produto')),
                DataColumn(label: Text('tipo')),
              ],
              onRowSelected: (selectedData) {
                final String newSelectedId = selectedData['idMovEstoque'];
                if (newSelectedId != selectedId) {
                  selectedId = selectedData['idMovEstoque'];
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
