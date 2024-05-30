import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/lista/lista_funcionarios.dart';

/* Widget seletor de usuário usado na tela de login
Recebe dados do banco pela função userList */

class UserSelect extends StatefulWidget {
  final void Function(Map<String, dynamic>?)? onUserSelected;

  const UserSelect({super.key, this.onUserSelected});

  @override
  State<UserSelect> createState() => _UserSelectState();
}

class _UserSelectState extends State<UserSelect> {
  Future<List<Map<String, dynamic>>>? _userList;
  Map<String, dynamic>? _selectedUser;

  @override
  void initState() {
    super.initState();
    _userList = listaFuncionarios();
  }

  @override
  Widget build(BuildContext context) {
    // Container(
    //   constraints: const BoxConstraints(
    //     maxHeight: 70,
    //     maxWidth: 1000,
    //     minHeight: 60,
    //     minWidth: 200,
    //   ),
    //   height: double.infinity,
    //   width: double.infinity,
    //   child: 
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: _userList,
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> funciList = snapshot.data!;
              return DropdownButtonFormField2<Map<String, dynamic>>(
                isExpanded: true,
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                 decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
                hint: const Text("Selecione seu usuário"),
                value: _selectedUser,
                onChanged: (Map<String, dynamic>? value) {
                  setState(() {
                    _selectedUser = value!;
                    widget.onUserSelected?.call(_selectedUser);
                  });
                },
                items: funciList.map((Map<String, dynamic> user) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: user,
                    child: Text('${user['idFuncionario']} - ${user['nome']}'),
                  );
                }).toList(),
                validator: (Map<String, dynamic>? value) {
                if (value == null) {
                  return "Insira o usuário";
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
