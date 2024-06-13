import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/delete/delete_funcionario.dart';
import 'package:stoque_ja/backend/operations/lista/lista_funcionarios.dart';
import 'package:stoque_ja/widgets/custom_app_bar.dart';
import 'package:stoque_ja/widgets/dialog_cadastro.dart';
import 'package:stoque_ja/widgets/drawer_component.dart';
import 'package:stoque_ja/widgets/function_buttons.dart';
import 'package:stoque_ja/widgets/list_component.dart';

// Construção da tela funcionários para mobile

class MobileFunc extends StatefulWidget {
  const MobileFunc({super.key});
  @override
  State<MobileFunc> createState() => _MobileFuncState();
}

class _MobileFuncState extends State<MobileFunc> {
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
    _funcList = listaFuncionarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const DrawerComponent(
        tela: 'Funcionarios',
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
                          final bool? result = await showDialog(
                            context: context,
                            builder: (context) => const DialogCadastro(
                              tipo: 'Funcionario',
                            ),
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
                        (kToolbarHeight * 2) - 48),
                width: MediaQuery.of(context).size.width,
                child: ListComponent(
                  lista: _funcList,
                  dadosCelulas: (Map<String, dynamic> funcionario) {
                    return [
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                          child: Text(funcionario['idFuncionario']),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            funcionario['nome'],
                            textScaler: const TextScaler.linear(0.95),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            funcionario['cargo'],
                            textScaler: const TextScaler.linear(0.95),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Text(
                            funcionario['telefone'],
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      ),
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
        ],
      ),
    );
  }
}
