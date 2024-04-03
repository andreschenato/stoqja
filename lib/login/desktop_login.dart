import 'package:flutter/material.dart';

class DesktopLogin extends StatefulWidget {
  const DesktopLogin({super.key});

  @override
  State<DesktopLogin> createState() => _DesktopLoginState();
}

class _DesktopLoginState extends State<DesktopLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Container(
                        constraints: const BoxConstraints(
                          maxHeight: 500,
                          maxWidth: 1000,
                          minHeight: 100,
                          minWidth: 200,
                        ),
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height/2,
                        color: Colors.amber,
                      )
                    ],
                  )),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.red,
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
