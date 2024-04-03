import 'package:flutter/material.dart';

class Responsivo extends StatelessWidget {
  const Responsivo({super.key, required this.mobile, required this.desktop});
  final Widget mobile;
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 650) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
