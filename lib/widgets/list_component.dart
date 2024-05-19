import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

// Widget que cria uma tabela para visualizar itens
// como funcionários, produtos e etc

class ListComponent extends StatefulWidget {
  final List<DataColumn> dadosColuna;
  final List<DataCell> Function(Map<String, dynamic> data) dadosCelulas;
  final Future<List<Map<String, dynamic>>>? lista;
  final Function(Map<String, dynamic> selectedData)? onRowSelected;
  const ListComponent({
    super.key,
    required this.lista,
    required this.dadosColuna,
    required this.dadosCelulas,
    this.onRowSelected,
  });

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  List<Map<String, dynamic>>? _data;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.lista,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          _data = snapshot.data;
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SuperSliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      DataTable(
                        border: TableBorder.all(
                          width: 1.5,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        showCheckboxColumn: false,
                        columns: widget.dadosColuna,
                        rows: buildDadosLinha(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  List<DataRow> buildDadosLinha() {
    return _data!.asMap().entries.map((entry) {
      final index = entry.key;
      final tipo = entry.value;
      final selected = index == _selectedIndex;
      return DataRow.byIndex(
        index: index,
        selected: selected,
        onSelectChanged: (selected) {
          setState(() {
            _selectedIndex = selected! ? index : -1;
          });
          if (widget.onRowSelected != null) {
            widget.onRowSelected!(tipo);
          }
        },
        cells: widget.dadosCelulas(tipo),
        color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.deepOrange.withOpacity(0.8);
            }
            return null;
          },
        ),
      );
    }).toList();
  }
}
