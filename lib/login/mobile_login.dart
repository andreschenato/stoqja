import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/login_widget.dart';

// Tela de login para mobile

class MobileLogin extends StatelessWidget {
  const MobileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  children: [
                    LoginWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
