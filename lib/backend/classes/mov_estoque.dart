import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/create/cadastro_mov_estoque.dart';
import 'package:stoque_ja/backend/operations/select/select_mov_estoque.dart';
import 'package:stoque_ja/backend/operations/update/update_mov_estoque.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';
import 'package:stoque_ja/widgets/produto_select.dart';
import 'package:stoque_ja/widgets/tipo_select_mov_estoque.dart';

class MovEstoque {
  late TextEditingController? descricao;
  late String? tipo;
  late String? idProduto;

  MovEstoque({String? descricao, String? tipo, String? idProduto}) {
    this.descricao = TextEditingController(text: descricao);
  }

  Widget campoDescricao(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 2000,
        maxLines: 4,
        controller: descricao!,
        warning: 'Insira sua descrição',
        label: 'Descrição',
      ),
    );
  }

  Widget campoTipo(int flex) {
    return Expanded(
      flex: flex,
      child: TipoSelector(
        onTipoChanged: (String? newValue) {
          tipo = newValue;
        },
      ),
    );
  }

  Widget campoProduto(int flex) {
    return Expanded(
      flex: flex,
      child: ProdutoSelect(
        onProdutoSelected: (selectedProd) {
          idProduto = selectedProd!['idProduto'];
        },
      ),
    );
  }

  void selectmovEstoque(String idMovEstoque) async {
    Map<String, dynamic> movEstoque = await selectMovEstoque(idMovEstoque);
    descricao?.text = movEstoque['descricao'];
    tipo = movEstoque['tipo'];
    idProduto = movEstoque['FK_idProduto'];
    movEstoque['descricao'] != null
        ? descricao?.text = movEstoque['descricao']
        : descricao?.text = '';
  }

  void updateMovEstoque(String idMovEstoque) {
    editMovEstoque(
      idMovEstoque,
      descricao!.text,
      idProduto!,
      tipo!,
    );
  }

  void createMovEstoque() {
    cadastroMovEstoque(
      descricao!.text,
      tipo!,
      idProduto!,
    );
  }
}
