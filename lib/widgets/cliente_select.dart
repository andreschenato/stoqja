import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/lista/lista_clientes.dart';

/* Widget seletor de cliente usado na tela de vendas
Recebe dados do banco pela função listaClientes */

class ClienteSelect extends StatefulWidget {
  final void Function(Map<String, dynamic>?)? onClienteSelected;

  const ClienteSelect({super.key, this.onClienteSelected});

  @override
  State<ClienteSelect> createState() => _UserSelectState();
}

class _UserSelectState extends State<ClienteSelect> {
  Future<List<Map<String, dynamic>>>? _clienteList;
  Map<String, dynamic>? _selectedUser;

  @override
  void initState() {
    super.initState();
    _clienteList = listaClientes();
  }

  @override
  Widget build(BuildContext context) { 
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _clienteList,
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> clienList = snapshot.data!;
              return DropdownButtonFormField2<Map<String, dynamic>>(
                isExpanded: true,
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                 decoration: InputDecoration(
                labelText: 'Cliente',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
                hint: const Text("Selecione o cliente"),
                value: _selectedUser,
                onChanged: (Map<String, dynamic>? value) {
                  setState(() {
                    _selectedUser = value!;
                    widget.onClienteSelected?.call(_selectedUser);
                  });
                },
                items: clienList.map((Map<String, dynamic> user) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: user,
                    child: Text('${user['idPessoa']} - ${user['nome']}'),
                  );
                }).toList(),
                validator: (Map<String, dynamic>? value) {
                if (value == null) {
                  return "Insira o cliente";
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
