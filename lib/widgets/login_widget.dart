import 'package:flutter/material.dart';
import 'package:stoque_ja/login/user_select.dart';
import 'package:stoque_ja/backend/valida_login.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String? usuario;
  final senha = TextEditingController();

  void redirect(bool isValid) {
    isValid
        ? Navigator.pushNamed(context, Rota.menu, arguments: usuario.toString())
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Usuário ou senha inválidos'),
            ),
          );
  }

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
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            height: 50,
            child: UserSelect(onUserSelected: (selectedUser) {
              setState(() {
                usuario = selectedUser;
              });
            }),
          ),
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: TextFormComponent(
              controller: senha,
              label: 'Senha',
              isSenha: true,
              onEnter: () async {
                bool? isValid;
                isValid = await validaLogin(usuario.toString(), senha.text);
                redirect(isValid);
              },
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 60,
              maxWidth: 1000,
            ),
            height: double.infinity,
            width: double.infinity,
            child: ElevatedButton(
              style: buttonTheme,
              onPressed: () async {
                bool? isValid;
                isValid = await validaLogin(usuario.toString(), senha.text);
                redirect(isValid);
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
