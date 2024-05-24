import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';
import 'package:stoque_ja/backend/cadastro_produto.dart';
import 'package:stoque_ja/backend/select_produtos.dart';
import 'package:stoque_ja/backend/update_produto.dart';

class Produto {
  late TextEditingController? nomeProduto;
  late TextEditingController? tipo;
  late TextEditingController? valor;
  late TextEditingController? observacao;
  late TextEditingController? categoria;
  late TextEditingController? quantidade;

  Produto({
    String? nomeProduto,
    String? tipo,
    String? valor,
    String? observacao,
    String? categoria,
    String? quantidade
  }) {
    this.nomeProduto = TextEditingController(text: nomeProduto);
    this.tipo = TextEditingController(text: tipo);
    this.valor = TextEditingController(text: valor);
    this.observacao = TextEditingController(text: observacao);
    this.categoria = TextEditingController(text: categoria);
    this.quantidade = TextEditingController(text: quantidade);
  }

  Widget campoNomeProduto(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: nomeProduto!,
        warning: 'Insira o nome do produto',
        label: 'Nome do Produto',
      ),
    );
  }

  Widget campoTipo(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: tipo!,
        warning: 'Insira o tipo',
        label: 'tipo do Produto',
      ),
    );
  }
  
  Widget campoObservacao(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: observacao!,
        warning: 'Insira a obs',
        label: 'observação',
      ),
    );
  }

  Widget campoCategoria(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: categoria!,
        warning: 'Insira a categoria',
        label: 'categoria do Produto',
      ),
    );
  }
  
  Widget campoValor(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 5,
        controller: valor!,
        warning: 'Insira o valor do produto',
        label: 'valor do Produto',
      ),
    );
  }

  Widget campoQuantidade(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: quantidade!,
        inputFormat: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        warning: 'Insira a quantidade',
        label: 'quantidade',
      ),
    );
  }

  void selectProd(String idProduto) async {
    Map<String, dynamic> produto= await selectProduto(idProduto);
    nomeProduto?.text = produto['nomeProduto'];
    tipo?.text = produto['tipo'];
    valor?.text = produto['valor'];
    observacao?.text = produto['observacao'];
    categoria?.text = produto['categoria'];
    quantidade?.text = produto['quantidade'];
  }

  void updateProd(String idProduto) {
    editProduto(
      idProduto,
      nomeProduto!.text,
      tipo!.text,
      valor!.text as double,
      observacao!.text,
      categoria!.text,
      quantidade!.text as int,
    );
  }

  void createProd() {
    cadastroProduto(
      nomeProduto!.text,
      tipo!.text,
      valor!.text as double?,
      observacao!.text,
      categoria!.text,
      quantidade!.text as int?,
    );
  }
}