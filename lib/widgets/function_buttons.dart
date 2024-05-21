import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/buttons_screens.dart';

// Widget que contém quatro botões (novo, editar, deletar e fechar)

class FunctionButtons extends StatelessWidget {
  final VoidCallback onPressedNovo;
  final VoidCallback onPressedEdit;
  final VoidCallback onPressedDelete;

  const FunctionButtons({super.key, required this.onPressedNovo, required this.onPressedEdit, required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonsScreen(
          icone: Icons.add_box_rounded,
          texto: 'Novo',
          onPressed: onPressedNovo,
        ),
        ButtonsScreen(
          icone: Icons.edit_document,
          texto: 'Editar',
          onPressed: onPressedEdit,
        ),
        ButtonsScreen(
          icone: Icons.delete,
          texto: 'Excluir',
          onPressed: onPressedDelete,
        ),
        ButtonsScreen(
          icone: Icons.close_fullscreen_rounded,
          texto: 'Fechar',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
