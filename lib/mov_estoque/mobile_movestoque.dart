import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/delete/delete_mov_estoque.dart';
import 'package:stoque_ja/backend/operations/lista/lista_mov_estoque.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela de movimentação de estoque para mobile

class MobileMovEstoque extends StatefulWidget {
  const MobileMovEstoque({super.key});

  @override
  State<MobileMovEstoque> createState() => _MobileMovEstoqueState();
}

class _MobileMovEstoqueState extends State<MobileMovEstoque> {
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
      resizeToAvoidBottomInset: false,
      drawer: const DrawerComponent(tela: 'MovEstoque'),
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
                      child: FunctionButtons(
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
                    ),
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
                  lista: _prodMovEstoque,
                  dadosCelulas: (Map<String, dynamic> movEstoque) {
                    return [
                      DataCell(
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                            child: Text(movEstoque['idMovEstoque']),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(movEstoque['nomeProduto'])),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(movEstoque['tipo']),
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
                            Text('ID'),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Produto'),
                          ],
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Tipo'),
                          ],
                        ),
                      ),
                    ),
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
        ],
      ),
    );
  }
}
