import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/delete_cliente.dart';
import 'package:stoque_ja/backend/lista_clientes.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela de clientes para desktop

class DesktopClientes extends StatefulWidget {
  const DesktopClientes({super.key});

  @override
  State<DesktopClientes> createState() => _DesktopClientesState();
}

class _DesktopClientesState extends State<DesktopClientes> {
  Future<List<Map<String, dynamic>>>? _clienteList;
  String? selectedId;

  void _loadCliList() {
    setState(() {
      _clienteList = listaClientes();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCliList();
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
                builder: (context) => const DialogCadastro(tipo: 'Cliente',),
              );
              if (resultado == true) {
                _loadCliList();
              }
            },
            onPressedEdit: () async {
              if (selectedId != null) {
                final bool? resultado = await showDialog(
                  context: context,
                  builder: (context) => DialogCadastro(
                    tipo: 'Cliente',
                    idCliente: selectedId,
                  ),
                );
                if (resultado == true) {
                  _loadCliList();
                }
              }
            },
            onPressedDelete: () async {
              if (selectedId != null) {
                await deleteCliente(selectedId);
                _loadCliList();
              }
            },
          ),
          Expanded(
            child: ListComponent(
              lista: _clienteList,
              dadosCelulas: (Map<String, dynamic> cliente) {
                return [
                  DataCell(Text(cliente['idPessoa'])),
                  DataCell(Text(cliente['nome'])),
                  DataCell(Text(cliente['telefone'])),
                  DataCell(Text(cliente['endereco'])),
                ];
              },
              dadosColuna: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Telefone')),
                DataColumn(label: Text('Endereço')),
              ],
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
      ),
    );
  }
}
