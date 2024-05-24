import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/campos_form_cliente.dart';
import 'package:stoque_ja/widgets/campos_form_fornecedor.dart';
import 'package:stoque_ja/widgets/campos_form_funcionario.dart';

// Dialog de cadastro do funcionário, implementa o formulario de cadastro

class DialogCadastro extends StatelessWidget {
  final String tipo;
  final String? idFuncionario;
  final String? idFornecedor;
  final String? idCliente;
  const DialogCadastro({
    super.key,
    this.idFuncionario,
    this.idCliente,
    required this.tipo,
    this.idFornecedor,
  });

  Widget caminho(String type) {
    return switch (type) {
      'Funcionario' => CamposFormFuncionario(
          idFuncionario: idFuncionario,
        ),
      'Cliente' => CamposFormCliente(idCliente: idCliente),
      'Fornecedor' => CamposFormFornecedor(idFornecedor: idFornecedor),
      _ => const SizedBox(),
    };
  }

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
        child: caminho(tipo),
      ),
    );
  }
}
