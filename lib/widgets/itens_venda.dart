import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/classes/produto.dart';
import 'package:stoque_ja/backend/classes/vendas.dart';
import 'package:stoque_ja/backend/operations/lista_itens_venda.dart';
import 'package:stoque_ja/theme/button_theme.dart';
import 'package:stoque_ja/widgets/dialog_pesquisa_produto.dart';
import 'package:stoque_ja/widgets/list_component.dart';

class ItensVenda extends StatefulWidget {
  const ItensVenda({super.key});

  @override
  State<ItensVenda> createState() => _ItensVendaState();
}

class _ItensVendaState extends State<ItensVenda> {
  late VendasOrdens venda;
  late Produto produto;

  @override
  void initState() {
    venda = VendasOrdens();
    produto = Produto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Itens da venda:',
                    textScaler: TextScaler.linear(1.3),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: buttonTheme,
                    onPressed: () async {
                      produto = await showDialog(
                          context: context,
                          builder: (context) => DialogPesquisaProduto());
                    },
                    child: const Text('Adicionar produto'),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.8,
                    width: MediaQuery.of(context).size.width / 1.31,
                    child: ListComponent(
                      lista: listaItensVenda(),
                      dadosCelulas: (Map<String, dynamic> itemVenda) {
                        return [
                          DataCell(Text(itemVenda['idProduto'])),
                          DataCell(Text(itemVenda['nomeProduto'])),
                          DataCell(Text(itemVenda['categoria'])),
                          DataCell(Text(itemVenda['valor'])),
                          DataCell(Text(itemVenda['quantidade'])),
                        ];
                      },
                      dadosColuna: const [
                        DataColumn(
                          label: Text(
                            'ID',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Nome',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Categoria',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Valor',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Quantidade',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Valor total:',
                    textScaler: TextScaler.linear(1.3),
                  ),
                  const Spacer(),
                  Text(
                    'R\$${venda.valorTotal}',
                    textScaler: const TextScaler.linear(1.3),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}