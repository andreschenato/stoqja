import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/delete_fornecedor.dart';
import 'package:stoque_ja/backend/lista_fornecedor.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela de fornecedores para desktop

class DesktopFornecedor extends StatefulWidget {
  const DesktopFornecedor({super.key});

  @override
  State<DesktopFornecedor> createState() => _DesktopFornecedorState();
}

class _DesktopFornecedorState extends State<DesktopFornecedor> {
  Future<List<Map<String, dynamic>>>? _fornecedorList;
  String? selectedId;

  void _loadFornecedor() {
    setState(() {
      _fornecedorList = listaFornecedores();
    });
  }

  @override
  void initState() {
    _loadFornecedor();
    super.initState();
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
                  builder: (context) => const DialogCadastro(
                    tipo: 'Fornecedor',
                  ),
                );
                if (resultado == true) {
                  _loadFornecedor();
                }
              },
              onPressedEdit: () async {
                if (selectedId != null) {
                  final bool? resultado = await showDialog(
                    context: context,
                    builder: (context) => DialogCadastro(
                      tipo: 'Fornecedor',
                      idFornecedor: selectedId,
                    ),
                  );
                  if (resultado == true) {
                    _loadFornecedor();
                  }
                }
              },
              onPressedDelete: () async {
                if (selectedId != null) {
                  await deleteFornecedor(selectedId);
                  _loadFornecedor();
                }
              },
            ),
            Expanded(
              child: ListComponent(
                lista: _fornecedorList,
                dadosColuna: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Telefone')),
                  DataColumn(label: Text('Endereço')),
                ],
                dadosCelulas: (Map<String, dynamic> cliente) {
                  return [
                    DataCell(Text(cliente['idPessoa'])),
                    DataCell(Text(cliente['nome'])),
                    DataCell(Text(cliente['telefone'])),
                    DataCell(Text(cliente['endereco'])),
                  ];
                },
                onRowSelected: (selectedData) {
                  final String newSelectedId = selectedData['idPessoa'];
                  if (newSelectedId != selectedId) {
                    selectedId = selectedData['idPessoa'];
                  } else {
                    selectedId = null;
                  }
                },
              ),
            ),
          ],
        ));
  }
}
