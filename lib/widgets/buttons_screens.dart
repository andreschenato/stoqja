import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  final IconData icone;
  final VoidCallback onPressed;
  final String texto;
  const ButtonsScreen({super.key, required this.icone, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle screenButton = ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll<Color>(Color(0XFFFF5002)),
      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 45,
          child: ElevatedButton.icon(
            style: screenButton,
            onPressed: onPressed,
            icon: Icon(icone),
            label: Text(texto),
          ),
        ),
      ),
    );
  }
}
