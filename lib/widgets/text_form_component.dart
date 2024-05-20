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
  final void Function(String)? onSubmit;
  final List<TextInputFormatter>? inputFormat;
  const TextFormComponent(
      {super.key, required this.controller, this.warning, required this.label, required this.maxL, this.txtInput, this.inputFormat, this.onSubmit});

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
      onFieldSubmitted: onSubmit,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return warning;
        }
        return null;
      },
    );
  }
}
