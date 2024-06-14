import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class TipoSelector extends StatefulWidget {
  final Function(String?)? onTipoChanged;
  const TipoSelector({super.key, this.onTipoChanged});

  @override
  State<TipoSelector> createState() => _TipoSelectorState();
}

final List<String> items = [
  "Roubado",
  "Quebrado",
  "Perdido",
  "Devolução",
];

class _TipoSelectorState extends State<TipoSelector> {
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      validator: (String? value) {
        if (value == null) {
          return "Insira o tipo";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: selectedType,
      onChanged: widget.onTipoChanged,
      dropdownStyleData: const DropdownStyleData(
        maxHeight: 150,
      ),
      decoration: InputDecoration(
        labelText: 'Tipo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: items
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
    );
  }
}
