import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/login/user_select.dart';
import 'package:stoque_ja/backend/operations/valida_login.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/logged_user.dart';
import 'package:stoque_ja/widgets/senha_form_field.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String? idUsuario;
  final senha = TextEditingController();

  void redirect(bool isValid) {
    isValid
        ? Navigator.pushNamed(context, Rota.menu,
            arguments: idUsuario.toString())
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
    bool isMobile = MediaQuery.of(context).size.width < 650 ? true : false;
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 600,
      ),
      width: isMobile
          ? MediaQuery.of(context).size.width / 1.2
          : MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            height: 55,
            child: UserSelect(onUserSelected: (selectedUser) {
              final login = context.read<LoggedUser>();
              login.logUser(selectedUser!['idFuncionario'],
                  selectedUser['nome'], selectedUser['cargo']);
              setState(() {
                idUsuario = selectedUser['idFuncionario'];
              });
            }),
          ),
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            height: 55,
            child: SenhaFormComponent(
              controller: senha,
              label: 'Senha',
              onEnter: () async {
                bool? isValid;
                isValid = await validaLogin(idUsuario.toString(), senha.text);
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
                isValid = await validaLogin(idUsuario.toString(), senha.text);
                redirect(isValid);
              },
              child: Text(
                'Login',
                textScaler: isMobile ? const TextScaler.linear(2.5) : const TextScaler.linear(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
