import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/delete_funcionario.dart';
import 'package:stoque_ja/backend/lista_funcionarios.dart';
import 'package:stoque_ja/widgets/dialog_cadastro_funcionario.dart';
import 'package:stoque_ja/widgets/buttons_screens.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/list_component.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonsScreen(
                icone: Icons.add_box_rounded,
                texto: 'Novo',
                onPressed: () async {
                  final bool? result = await showDialog(
                    context: context,
                    builder: (context) => const DialogCadastroFuncionario(),
                  );
                  if (result == true) {
                    _loadFuncList();
                  }
                },
              ),
              ButtonsScreen(
                icone: Icons.edit_document,
                texto: 'Editar',
                onPressed: () async {
                  final bool? result = await showDialog(
                    context: context,
                    builder: (context) => DialogCadastroFuncionario(idFuncionario: selectedId,),
                  );
                  if (result == true) {
                    _loadFuncList();
                  }
                },
              ),
              ButtonsScreen(
                icone: Icons.delete,
                texto: 'Excluir',
                onPressed: () async {
                  if (selectedId != null) {
                    await deleteFuncionario(selectedId);
                    _loadFuncList();
                  }
                },
              ),
              ButtonsScreen(
                icone: Icons.close_fullscreen_rounded,
                texto: 'Fechar',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
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
                selectedId = selectedData['idFuncionario'];
              },
            ),
          ),
        ],
      ),
    );
  }
}
