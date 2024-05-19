import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/campos_form_funcionario.dart';

// Dialog de cadastro do funcionário, implementa o formulario de cadastro

class DialogCadastroFuncionario extends StatelessWidget {
  final String? idFuncionario;
  const DialogCadastroFuncionario({super.key, this.idFuncionario});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: size.height / 1.2,
          maxWidth: size.width / 1.2,
          minHeight: size.height / 2,
        ),
        child: CamposFormFuncionario(
          idFuncionario: idFuncionario,
        ),
      ),
    );
  }
}
