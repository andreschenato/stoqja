import 'package:flutter/material.dart';
import 'package:stoque_ja/theme/button_theme.dart';

// Criação do widget do botão usado nos botões do menu

class GridButton extends StatelessWidget {
  final String textoBotao;
  final VoidCallback onPressed;
  final IconData icone;
  const GridButton({
    super.key,
    required this.textoBotao,
    required this.onPressed,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    double textSize, iconSize;
    MediaQuery.of(context).size.width < 650
        ? (textSize = 28, iconSize = 70)
        : (textSize = 36, iconSize = 100);
    return ElevatedButton(
      style: buttonTheme,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Icon(
                    icone,
                    size: iconSize,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    textoBotao,
                    style: TextStyle(
                      fontSize: textSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
