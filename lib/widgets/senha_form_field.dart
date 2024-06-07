import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget para substituir o campo de texto
// padrão nos formulários

class SenhaFormComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? warning;
  final String label;
  final String? hint;
  final int? maxL;
  final TextInputType? txtInput;
  final void Function()? onEnter;
  final List<TextInputFormatter>? inputFormat;
  const SenhaFormComponent({
    super.key,
    required this.controller,
    this.warning,
    required this.label,
    this.maxL,
    this.txtInput,
    this.inputFormat,
    this.hint,
    this.onEnter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFFFF6D04), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFFFF6D04), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFFFF0418), width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0XFFFF0418), width: 2),
        ),
        errorStyle: const TextStyle(color: Color(0XFFFF0418)),
        floatingLabelStyle: const TextStyle(color: Color(0XFFFF6D04)),
        hintText: hint,
        label: Text(label),
      ),
      controller: controller,
      maxLength: maxL,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: txtInput,
      inputFormatters: inputFormat,
      onEditingComplete: onEnter,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return warning;
        }
        return null;
      },
    );
  }
}
