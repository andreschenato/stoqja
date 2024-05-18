import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/funcionario.dart';
import 'package:stoque_ja/widgets/form_cadastro.dart';

// Componentes do formulário do funcionário

class CamposFormFuncionario extends StatefulWidget {
  final String? idFuncionario;
  const CamposFormFuncionario({super.key, this.idFuncionario});

  @override
  State<CamposFormFuncionario> createState() =>
      _CamposFormFuncionarioState();
}

class _CamposFormFuncionarioState extends State<CamposFormFuncionario> {
  late Funcionario funcionario;

  @override
  void initState() {
    funcionario = Funcionario();
    if (widget.idFuncionario != null) {
      funcionario.selectFunc(widget.idFuncionario!);
    }
    super.initState();
  }

  @override
  void dispose() {
    funcionario.nome?.dispose();
    funcionario.cpfCnpj?.dispose();
    funcionario.telefone?.dispose();
    funcionario.email?.dispose();
    funcionario.endereco?.dispose();
    funcionario.cep?.dispose();
    funcionario.numEndereco?.dispose();
    funcionario.complemento?.dispose();
    funcionario.bairro?.dispose();
    funcionario.cargo?.dispose();
    funcionario.senha?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String labelBotao;
    widget.idFuncionario != null
        ? labelBotao = 'Salvar'
        : labelBotao = 'Cadastrar';
    return FormCadastro(
          formKey: formKey,
          components: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                funcionario.campoNome(),
                const Spacer(),
                funcionario.campoCargo(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                funcionario.campoCpfCnpj(),
                const Spacer(),
                funcionario.campoTelefone(),
                const Spacer(),
                funcionario.campoSenha(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                funcionario.campoEmail(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                funcionario.campoCep(),
                const Spacer(),
                funcionario.campoEndereco(),
                const Spacer(),
                funcionario.campoNumEndereco(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                funcionario.campoBairro(),
                const Spacer(),
                funcionario.campoIdCidade(),
                const Spacer(),
                funcionario.campoComplemento(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancelar'),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.idFuncionario != null) {
                      if (formKey.currentState!.validate()) {
                        funcionario.updateFunc(widget.idFuncionario!);
                        Timer(
                          const Duration(seconds: 1),
                          () {
                            Navigator.of(context).pop(true);
                          },
                        );
                      }
                    } else if (formKey.currentState!.validate()) {
                      funcionario.createFunc();
                      Timer(
                        const Duration(seconds: 1),
                        () {
                          Navigator.of(context).pop(true);
                        },
                      );
                    }
                  },
                  child: Text(labelBotao),
                ),
              ],
            ),
          ],
        );
  }
}
