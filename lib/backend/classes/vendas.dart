import 'package:flutter/material.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class VendasOrdens {
  late TextEditingController? produto;
  late TextEditingController? valorTotal;
  late TextEditingController? status;
  late TextEditingController? cliente;
  late TextEditingController? funcionario;
  late TextEditingController? quantidade;
  late TextEditingController? laudo;
  late TextEditingController? descricao;
  late TextEditingController? codVenda;
  late TextEditingController? codItem;

  VendasOrdens({
    String? produto,
    String? valorTotal,
    String? status,
    String? cliente,
    String? funcionario,
    String? quantidade,
    String? laudo,
    String? descricao,
    String? codVenda,
    String? codItem,
  }) {
    this.produto = TextEditingController(text: produto);
    this.valorTotal = TextEditingController(text: valorTotal);
    this.status = TextEditingController(text: status);
    this.cliente = TextEditingController(text: cliente);
    this.funcionario = TextEditingController(text: funcionario);
    this.quantidade = TextEditingController(text: quantidade);
    this.laudo = TextEditingController(text: laudo);
    this.descricao = TextEditingController(text: descricao);
    this.codVenda = TextEditingController(text: codVenda);
    this.codItem = TextEditingController(text: codItem);
  }

  Widget campoFuncionario(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        controller: funcionario!,
        warning: 'Insira o funcionário',
        label: 'Vendedor',
      ),
    );
  }
}
