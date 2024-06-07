import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/create/cadastro_movEstoque.dart';
import 'package:stoque_ja/backend/operations/select/select_movEstoque.dart';
import 'package:stoque_ja/backend/operations/update/update_movEstoque.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class MovEstoque {
  late TextEditingController? descricao;
  late TextEditingController? tipo;
  late TextEditingController? idProduto;

  MovEstoque({String? descricao, String? tipo, String? idProduto}) {
    this.descricao = TextEditingController(text: descricao);
    this.tipo = TextEditingController(text: tipo);
    this.idProduto = TextEditingController(text: idProduto);
  }

  Widget campoDescricao(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 2000,
        controller: descricao!,
        warning: 'Insira sua descrição',
        label: 'Descrição',
      ),
    );
  }

  Widget campoTipo(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 40,
        controller: tipo!,
        warning: 'Tipo',
        label: 'Situação',
      ),
    );
  }

  void selectmovEstoque(String idMovEstoque) async {
    Map<String, dynamic> movEstoque = await selectMovEstoque(idMovEstoque);
    descricao?.text = movEstoque['descrição'];
    tipo?.text = movEstoque['tipo'];
    //idProduto?.text = movEstoque['idProduto'];
  }

  void updateMovEstoque(String idMovEstoque) {
    editMovEstoque(
      idMovEstoque,
      descricao!.text,
      tipo!.text,
    );
  }

  void createMovEstoque() {
    cadastroMovEstoque(
      descricao!.text,
      tipo!.text,
    ); // idProduto!.text
  }
}
