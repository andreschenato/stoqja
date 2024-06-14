import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/backend/operations/create_carrinho.dart';
import 'package:stoque_ja/backend/operations/delete/delete_venda.dart';
import 'package:stoque_ja/backend/operations/get_id_venda.dart';
import 'package:stoque_ja/backend/operations/lista/lista_vendas.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

// Construção da tela de vendas e ordens para desktop

class DesktopVendasOrdens extends StatefulWidget {
  const DesktopVendasOrdens({super.key});

  @override
  State<DesktopVendasOrdens> createState() => _DesktopVendasOrdensState();
}

class _DesktopVendasOrdensState extends State<DesktopVendasOrdens> {
  Future<List<Map<String, dynamic>>>? _vendaList;
  String? selectedId;

  void _loadVendaList() {
    setState(() {
      _vendaList = listaVendas();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadVendaList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(
      builder: (context, value, child) => Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            FunctionButtons(
              onPressedNovo: () async {
                await createCarrinho(value.idUser);
                String idVenda = await getCodVenda();
                final bool? resultado = await showDialog(
                  context: context,
                  builder: (context) => DialogCadastro(
                    tipo: 'Vendas',
                    idVenda: idVenda,
                  ),
                );
                if (resultado == true) {
                  _loadVendaList();
                } else {
                  deleteVenda(idVenda);
                }
              },
              onPressedEdit: () async {
                if(selectedId != null) {
                  final bool? resultado = await showDialog(
                  context: context,
                  builder: (context) => DialogCadastro(
                    tipo: 'Vendas',
                    idVenda: selectedId,
                  ),
                );
                if (resultado == true) {
                  _loadVendaList();
                }
                }
              },
              onPressedDelete: () async {
                if (selectedId != null) {
                  await deleteVenda(selectedId);
                  _loadVendaList();
                }
              },
            ),
            Expanded(
              child: ListComponent(
                lista: _vendaList,
                dadosCelulas: (Map<String, dynamic> venda) {
                  return [
                    DataCell(Text(venda['codigo'])),
                    DataCell(Text(venda['nome'])),
                    DataCell(Text(venda['status'])),
                  ];
                },
                dadosColuna: const [
                  DataColumn(label: Text('Codigo')),
                  DataColumn(label: Text('Nome Cliente')),
                  DataColumn(label: Text('Status')),
                ],
                onRowSelected: (selectedData) {
                  final String newSelectedId = selectedData['idCarrinho'];
                  if (newSelectedId != selectedId) {
                    selectedId = selectedData['idCarrinho'];
                  } else {
                    selectedId = null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
