import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoque_ja/rotas/routes.dart';
import 'package:stoque_ja/widgets/logged_user.dart';

// Widget que cria uma appBar para desktop

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(
      builder: (context, value, child) => AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Color(0XFFf5f2f0),
                    size: 50,
                  )
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.username.toString(),
                    style: const TextStyle(
                      color: Color(0XFFf5f2f0),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    value.cargo.toString(),
                    style: const TextStyle(
                      color: Color(0XFFf5f2f0),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      overlayColor:
                          WidgetStatePropertyAll<Color>(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Rota.login);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Encerrar sessão',
                          style: TextStyle(
                            color: Color(0XFFf5f2f0),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Color(0XFFf5f2f0),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
