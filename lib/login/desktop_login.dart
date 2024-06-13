import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/login_widget.dart';

// Tela de login para desktop

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: size.height / 10,
                      image: const AssetImage('assets/imagens/stoq.png'),
                    ),
                    const LoginWidget(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 3,
                    child: const SizedBox.expand(
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        fit: BoxFit.cover,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          image:
                              AssetImage('assets/imagens/HomiNoTelefone.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
