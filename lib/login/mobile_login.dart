import 'package:flutter/material.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Container(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
