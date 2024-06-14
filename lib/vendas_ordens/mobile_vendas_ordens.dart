import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/backend/operations/create_carrinho.dart';
import 'package:stoque_ja/backend/operations/delete/delete_venda.dart';
import 'package:stoque_ja/backend/operations/get_id_venda.dart';
import 'package:stoque_ja/backend/operations/lista/lista_vendas.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

// Construção da tela de vendas e ordens para mobile

class MobileVendasOrdens extends StatefulWidget {
  const MobileVendasOrdens({super.key});

  @override
  State<MobileVendasOrdens> createState() => _MobileVendasOrdensState();
}

class _MobileVendasOrdensState extends State<MobileVendasOrdens> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerComponent(tela: 'VendasOrdens'),
      appBar: const CustomAppBar(),
      body: Wrap(
        direction: Axis.horizontal,
        children: [
          Row(
            children: [
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1.5,
                      child: Consumer<LoggedUser>(
                        builder: (context, value, child) => FunctionButtons(
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
                            if (selectedId != null) {
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
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                    (kToolbarHeight * 2) -
                    48),
                width: MediaQuery.of(context).size.width,
                child: ListComponent(
                  lista: _vendaList,
                  dadosCelulas: (Map<String, dynamic> venda) {
                    return [
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                          child: Text(venda['codigo']),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Text(venda['nome']),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.85,
                          child: Text(venda['status']),
                        ),
                      ),
                    ];
                  },
                  dadosColuna: const [
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Codigo'),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Nome Cliente'),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Status'),
                          ],
                        ),
                      ),
                    ),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
