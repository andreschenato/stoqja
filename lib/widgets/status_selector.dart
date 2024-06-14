import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class StatusSelector extends StatefulWidget {
  final Function(String?)? onChanged;
  const StatusSelector({super.key, this.onChanged});

  @override
  State<StatusSelector> createState() => _StatusSelectorState();
}

String selectedValue = 'Em andamento';

final List<String> items = [
  "Em andamento",
  "Concluído",
  "Cancelado",
  "Sem reparo",
  "Orçamento não aprovado",
];

class _StatusSelectorState extends State<StatusSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: selectedValue,
      onChanged: widget.onChanged,
      dropdownStyleData: const DropdownStyleData(
        maxHeight: 150,
      ),
      decoration: InputDecoration(
        labelText: 'Status',
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
