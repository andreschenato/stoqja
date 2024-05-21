import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/delete_funcionario.dart';
import 'package:stoque_ja/backend/lista_funcionarios.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela funcionários para desktop

class DesktopFunc extends StatefulWidget {
  const DesktopFunc({super.key});

  @override
  State<DesktopFunc> createState() => _DesktopFuncState();
}

class _DesktopFuncState extends State<DesktopFunc> {
  Future<List<Map<String, dynamic>>>? _funcList;
  String? selectedId;

  void _loadFuncList() {
    setState(() {
      _funcList = listaFuncionarios();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFuncList();
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
              final bool? result = await showDialog(
                context: context,
                builder: (context) => const DialogCadastro(tipo: 'Funcionario',),
              );
              if (result == true) {
                _loadFuncList();
              }
            },
            onPressedEdit: () async {
              if (selectedId != null) {
                final bool? result = await showDialog(
                  context: context,
                  builder: (context) => DialogCadastro(
                    tipo: 'Funcionario',
                    idFuncionario: selectedId,
                  ),
                );
                if (result == true) {
                  _loadFuncList();
                }
              }
            },
            onPressedDelete: () async {
              if (selectedId != null) {
                await deleteFuncionario(selectedId);
                _loadFuncList();
              }
            },
          ),
          
          Expanded(
            child: ListComponent(
              lista: _funcList,
              dadosCelulas: (Map<String, dynamic> funcionario) {
                return [
                  DataCell(Text(funcionario['idFuncionario'])),
                  DataCell(Text(funcionario['nome'])),
                  DataCell(Text(funcionario['cargo'])),
                  DataCell(Text(funcionario['telefone'])),
                ];
              },
              dadosColuna: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Cargo')),
                DataColumn(label: Text('Telefone')),
              ],
              onRowSelected: (selectedData) {
                final String newSelectedId = selectedData['idFuncionario'];
                if (newSelectedId != selectedId) {
                  selectedId = selectedData['idFuncionario'];
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
