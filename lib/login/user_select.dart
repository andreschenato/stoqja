import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stoque_ja/login/user_list.dart';

/* Widget seletor de usuário usado na tela de login
Recebe dados do banco pela função userList */

class UserSelect extends StatefulWidget {
  final void Function(String?)? onUserSelected;
  const UserSelect({super.key, this.onUserSelected});

  @override
  State<UserSelect> createState() => _UserSelectState();
}

class _UserSelectState extends State<UserSelect> {
  Future? _userList;
  String? _selectedUser;

  String? get selectedUser => _selectedUser;

  @override
  void initState() {
    super.initState();
    _userList = userList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 70,
        maxWidth: 1000,
        minHeight: 60,
        minWidth: 200,
      ),
      height: double.infinity,
      width: double.infinity,
      child: FutureBuilder(
        future: _userList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<String> userList = snapshot.data;
              return DropdownButtonFormField2<String>(
                isExpanded: true,
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                decoration: InputDecoration(
                  label: const Text('Usuário'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                hint: const Text("Selecione seu usuário"),
                value: _selectedUser,
                onChanged: (String? value) {
                  setState(() {
                    _selectedUser = value!;
                    widget.onUserSelected?.call(_selectedUser);
                  });
                },
                items: userList.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
