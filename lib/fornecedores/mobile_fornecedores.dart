import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/delete/delete_fornecedor.dart';
import 'package:stoque_ja/backend/operations/lista/lista_fornecedor.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela de fornecedores para mobile

class MobileFornecedor extends StatefulWidget {
  const MobileFornecedor({super.key});

  @override
  State<MobileFornecedor> createState() => _MobileFornecedorState();
}

class _MobileFornecedorState extends State<MobileFornecedor> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerComponent(
        tela: 'Fornecedores',
      ),
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
                  lista: _fornecedorList,
                  dadosColuna: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Nome')),
                    DataColumn(label: Text('Telefone')),
                    DataColumn(label: Text('Endereço')),
                  ],
                  dadosCelulas: (Map<String, dynamic> cliente) {
                    return [
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                          child: Text(cliente['idPessoa']),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            cliente['nome'],
                            textScaler: const TextScaler.linear(0.95),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            cliente['telefone'],
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Text(
                            cliente['endereco'],
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      ),
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
          )
        ],
      ),
    );
  }
}
