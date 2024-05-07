import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/lista_funcionarios.dart';
import 'package:stoque_ja/widgets/buttons_screens.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/list_component.dart';
import 'package:stoque_ja/widgets/mobile_appbar.dart';

class MobileFunc extends StatefulWidget {
  const MobileFunc({super.key});
  @override
  State<MobileFunc> createState() => _MobileFuncState();
}

class _MobileFuncState extends State<MobileFunc> {
  Future<List<Map<String, dynamic>>>? _funcList;
  @override
  void initState() {
    super.initState();
    _funcList = listaFuncionarios();
  }

  @override
  Widget build(BuildContext context) {
    final String usuario = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      drawer: const DrawerComponent(
        tela: 'Funcionarios',
      ),
      appBar: MobileAppbar(usuario),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonsScreen(
                icone: Icons.add_box,
                texto: 'Novo',
                onPressed: () {},
              ),
              ButtonsScreen(
                icone: Icons.edit_document,
                texto: 'Editar',
                onPressed: () {},
              ),
              ButtonsScreen(
                icone: Icons.delete,
                texto: 'Excluir',
                onPressed: () {},
              ),
              ButtonsScreen(
                icone: Icons.close_fullscreen_rounded,
                texto: 'Fechar',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
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
            ),
          ),
        ],
      ),
    );
  }
}
