import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/lista/lista_produtos.dart';

/* Widget seletor de cliente usado na tela de vendas
Recebe dados do banco pela função listaClientes */

class ProdutoSelect extends StatefulWidget {
  final void Function(Map<String, dynamic>?)? onProdutoSelected;

  const ProdutoSelect({super.key, this.onProdutoSelected});

  @override
  State<ProdutoSelect> createState() => _ProdSelectState();
}

class _ProdSelectState extends State<ProdutoSelect> {
  Future<List<Map<String, dynamic>>>? _produtoList;
  Map<String, dynamic>? _selectedProd;

  @override
  void initState() {
    super.initState();
    _produtoList = listaProdutos();
  }

  @override
  Widget build(BuildContext context) { 
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _produtoList,
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> prodList = snapshot.data!;
              return DropdownButtonFormField2<Map<String, dynamic>>(
                isExpanded: true,
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                 decoration: InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
                hint: const Text("Selecione o produto"),
                value: _selectedProd,
                onChanged: (Map<String, dynamic>? value) {
                  setState(() {
                    _selectedProd = value!;
                    widget.onProdutoSelected?.call(_selectedProd);
                  });
                },
                items: prodList.map((Map<String, dynamic> prod) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: prod,
                    child: Text('${prod['idProduto']} - ${prod['nomeProduto']}'),
                  );
                }).toList(),
                validator: (Map<String, dynamic>? value) {
                if (value == null) {
                  return "Insira o produto";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
  }
}
