import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/delete/delete_cliente.dart';
import 'package:stoque_ja/backend/operations/lista/lista_clientes.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela de clientes para mobile

class MobileClientes extends StatefulWidget {
  const MobileClientes({super.key});

  @override
  State<MobileClientes> createState() => _MobileClientesState();
}

class _MobileClientesState extends State<MobileClientes> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerComponent(
        tela: 'Clientes',
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
                              tipo: 'Cliente',
                            ),
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
                  lista: _clienteList,
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
                            overflow: TextOverflow.ellipsis,
                            cliente['endereco'],
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      ),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
