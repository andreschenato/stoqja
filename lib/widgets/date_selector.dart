import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  final String label;
  final String warning;
  final TextEditingController controller;

  const DateSelector(
      {super.key,
      required this.controller,
      required this.label,
      required this.warning});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // decoration: InputDecoration(
      //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      //   label: Text(widget.label),
      // ),
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
        label: Text(widget.label),
      ),
      controller: widget.controller,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return widget.warning;
        }
        return null;
      },
      readOnly: true,
      onTap: _selectDate,
    );
  }

  Future<void> _selectDate() async {
    DateTime? selecionado = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selecionado != null) {
      setState(() {
        widget.controller.text = selecionado.toString().split(" ")[0]; 
      });
    }
  }
}
