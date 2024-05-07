import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/lista_clientes.dart';
import 'package:stoque_ja/widgets/buttons_screens.dart';
import 'package:stoque_ja/widgets/desktop_appbar.dart';
import 'package:stoque_ja/widgets/list_component.dart';

class DesktopClientes extends StatefulWidget {
  const DesktopClientes({super.key});

  @override
  State<DesktopClientes> createState() => _DesktopClientesState();
}

class _DesktopClientesState extends State<DesktopClientes> {
  Future<List<Map<String, dynamic>>>? _clienteList;

  @override
  void initState() {
    super.initState();
    _clienteList = listaClientes();
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
              ),
            ],
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
            ),
          ),
        ],
      ),
    );
  }
}
