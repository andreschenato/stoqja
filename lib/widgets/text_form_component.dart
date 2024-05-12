import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget para substituir o campo de texto
// padrão nos formulários

class TextFormComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? warning;
  final String label;
  final int maxL;
  final TextInputType? txtInput;
  final List<TextInputFormatter>? inputFormat;
  const TextFormComponent(
      {super.key, required this.controller, this.warning, required this.label, required this.maxL, this.txtInput, this.inputFormat});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        label: Text(label),
      ),
      controller: controller,
      maxLength: maxL,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: txtInput,
      inputFormatters: inputFormat,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return warning;
        }
        return null;
      },
    );
  }
}
