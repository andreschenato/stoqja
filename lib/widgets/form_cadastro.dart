import 'package:flutter/material.dart';

// Widget de formulário usado em todos os formulários 
// para economizar linhas

class FormCadastro extends StatelessWidget {
  final List<Widget> components;
  final Key formKey;
  const FormCadastro({super.key, required this.components, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final ScrollController scr = ScrollController();
    return Scaffold(
      body: Scrollbar(
        thickness: 8,
        thumbVisibility: true,
        controller: scr,
        child: SingleChildScrollView(
          controller: scr,
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: components,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
