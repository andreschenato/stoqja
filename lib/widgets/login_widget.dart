import 'package:flutter/material.dart';
import 'package:stoque_ja/login/user_select.dart';
import 'package:stoque_ja/backend/valida_login.dart';
import 'package:stoque_ja/rotas/routes.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? colorScheme.surface
            : const Color.fromARGB(255, 198, 198, 198),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
              minWidth: 200,
            ),
            height: 55,
            child: UserSelect(onUserSelected: (selectedUser) {
              setState(() {
                usuario = selectedUser;
              });
            }),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 55,
            child: TextField(
              controller: senha,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Digite sua senha',
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return colorScheme.onSurface.withOpacity(0.12);
                    }
                    return colorScheme.primary;
                  },
                ),
              ),
              onPressed: () async {
                bool? isValid;
                isValid = await validaLogin(usuario.toString(), senha.text);
                redirect(isValid);
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  color: theme.brightness == Brightness.dark
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
