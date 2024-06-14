import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:stoque_ja/backend/operations/create/cadastro_itens_venda.dart';
import 'package:stoque_ja/backend/operations/select/select_venda.dart';
import 'package:stoque_ja/backend/operations/update/update_venda.dart';
import 'package:stoque_ja/login/user_select.dart';
import 'package:stoque_ja/widgets/cliente_select.dart';
import 'package:stoque_ja/widgets/status_selector.dart';
import 'package:stoque_ja/widgets/text_form_component.dart';

class VendasOrdens {
  late String? cliente;
  late String? funcionario;
  late String? valorTotal;
  late String? status;
  late TextEditingController? quantidade;
  late TextEditingController? valorItens;
  late TextEditingController? laudo;
  late TextEditingController? descricao;

  VendasOrdens({
    this.cliente,
    this.funcionario,
    this.status,
    this.valorTotal,
    String? quantidade,
    String? laudo,
    String? descricao,
    String? valorItens,
    String? codVenda,
    String? codItem,
  }) {
    this.valorItens = TextEditingController(text: valorItens);
    this.quantidade = TextEditingController(text: quantidade);
    this.laudo = TextEditingController(text: laudo);
    this.descricao = TextEditingController(text: descricao);
  }

  void atualizarValItens(double valorProduto) {
    int qtd = int.tryParse(quantidade?.text ?? '1') ?? 1;
    double total = qtd * valorProduto;
    valorItens?.text = total.toStringAsFixed(2);
  }

  Widget campoFuncionario(int flex) {
    return Expanded(
      flex: flex,
      child: UserSelect(
        onUserSelected: (selectedUser) {
          funcionario = selectedUser!['idFuncionario'];
        },
      ),
    );
  }

  Widget campoStatus(int flex) {
    return Expanded(
      flex: flex,
      child: StatusSelector(
        onChanged: (String? newValue) {
          status = newValue!;
        },
      ),
    );
  }

  Widget campoCliente(int flex) {
    return Expanded(
      flex: flex,
      child: ClienteSelect(
        onClienteSelected: (selectedCliente) {
          cliente = selectedCliente!['idPessoa'];
        },
      ),
    );
  }

  Widget campoQuantidadeItem(flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 200,
        controller: quantidade!,
        inputFormat: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        warning: 'Insira a quantidade',
        label: 'Quantidade',
      ),
    );
  }

  Widget campoValorItem(flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxL: 13,
        controller: valorItens!,
        warning: 'Insira o valor total dos itens',
        label: 'Valor Total',
      ),
    );
  }

  Widget campoDesc(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxLines: 10,
        controller: descricao!,
        label: 'Descrição do problema',
        hint: 'Insira aqui a descrição do problema',
        txtInput: TextInputType.multiline,
      ),
    );
  }

  Widget campoLaudo(int flex) {
    return Expanded(
      flex: flex,
      child: TextFormComponent(
        maxLines: 10,
        controller: laudo!,
        label: 'Laudo',
        hint: 'Insira aqui a resolução do problema',
        txtInput: TextInputType.multiline,
      ),
    );
  }

  void selecionaVenda(String idVenda) async {
    Map<String, dynamic> venda = await selectVenda(idVenda);
    valorTotal = venda['valorTotal'];
    status = venda['status'];
    venda['laudo'] != null ? laudo?.text = venda['laudo'] : laudo?.text = '';
    venda['descricao'] != null
        ? descricao?.text = venda['descricao']
        : descricao?.text = '';
  }

  Future<void> criaItem(String idVenda, String idProduto) async {
    cadastroItensVenda(
      idProduto,
      idVenda,
      quantidade?.text,
      valorItens?.text,
    );
  }

  void updateVenda(String idVenda) {
    editVenda(
      idVenda,
      valorTotal!,
      funcionario!,
      cliente!,
      descricao!.text,
      laudo!.text,
      status!,
    );
  }
}
