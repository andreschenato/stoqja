import 'package:flutter/material.dart';
import 'package:stoque_ja/theme/button_theme.dart';

// Widget dos botões que define o tema e requisita 
// ícones, a função quando pressionado e o texto

class ButtonsScreen extends StatelessWidget {
  final IconData icone;
  final VoidCallback onPressed;
  final String texto;
  const ButtonsScreen({super.key, required this.icone, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 45,
          child: ElevatedButton.icon(
            style: buttonTheme,
            onPressed: onPressed,
            icon: Icon(icone),
            label: Text(texto),
          ),
        ),
      ),
    );
  }
}
