import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/campos_forms/campos_form_cliente.dart';
import 'package:stoque_ja/widgets/campos_forms/campos_form_fornecedor.dart';
import 'package:stoque_ja/widgets/campos_forms/campos_form_funcionario.dart';
import 'package:stoque_ja/widgets/campos_forms/campos_form_movEstoque.dart';
import 'package:stoque_ja/widgets/campos_forms/campos_form_produto.dart';
import 'package:stoque_ja/widgets/campos_forms/campos_form_vendas.dart';

// Dialog de cadastro do funcionário, implementa o formulario de cadastro

class DialogCadastro extends StatelessWidget {
  final String tipo;
  final String? idFuncionario;
  final String? idFornecedor;
  final String? idCliente;
  final String? idProduto;
<<<<<<< HEAD
  final String? idVenda;
=======
  final String? idMovEstoque;
>>>>>>> a3e6669c256001558087f1e1e559d272f027e65d
  const DialogCadastro({
    super.key,
    this.idFuncionario,
    this.idCliente,
    this.idProduto,
    required this.tipo,
<<<<<<< HEAD
    this.idFornecedor, this.idVenda,
=======
    this.idFornecedor,
    this.idMovEstoque,
>>>>>>> a3e6669c256001558087f1e1e559d272f027e65d
  });

  Widget caminho(String type) {
    return switch (type) {
      'Funcionario' => CamposFormFuncionario(idFuncionario: idFuncionario),
      'Cliente' => CamposFormCliente(idCliente: idCliente),
      'Fornecedor' => CamposFormFornecedor(idFornecedor: idFornecedor),
      'Produto' => CamposFormProduto(idProduto: idProduto),
<<<<<<< HEAD
      'Vendas' => CamposFormVendas(idVenda: idVenda),
=======
      'MovEstoque' => CamposFormMovEstoque(idMovEstoque: idMovEstoque),
>>>>>>> a3e6669c256001558087f1e1e559d272f027e65d
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
