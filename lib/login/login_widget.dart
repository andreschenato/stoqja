import 'package:flutter/material.dart';
import 'package:stoque_ja/login/user_select.dart';
import 'package:stoque_ja/login/valida_login.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String? usuario;
  final senha = TextEditingController();

  @override
  void dispose() {
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 600,
        minHeight: 100,
        minWidth: 300,
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
              minWidth: 200,
            ),
            child: UserSelect(onUserSelected: (selectedUser) {
              setState(() {
                usuario = selectedUser;
              });
            }),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: senha,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Senha',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 70,
              maxWidth: 1000,
              minHeight: 60,
              minWidth: 200,
            ),
            height: double.infinity,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              onPressed: () async {
                bool? isValid;
                isValid = await validaLogin(usuario.toString(), senha.text);
                if (isValid) {
                  Navigator.pushNamed(context, '/Menu', arguments: usuario.toString());
                } else {
                  Center(child: Text('Usuário ou senha inválidos'));
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
