import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stoque_ja/backend/operations/lista/lista_cidades.dart';

/* Widget que permite fazer a seleção de cidade
no formulário de cadastro dos usuários */

class CitySelect extends StatefulWidget {
  final void Function(Map<String, dynamic>?)? onCitySelected;

  const CitySelect({super.key, this.onCitySelected});

  @override
  State<CitySelect> createState() => _CitySelectState();
}

class _CitySelectState extends State<CitySelect> {
  final TextEditingController textSearch = TextEditingController();
  Future<List<Map<String, dynamic>>>? _cityList;
  Map<String, dynamic>? _selectedCity;

  @override
  void dispose() {
    textSearch.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _cityList = listaCidades();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _cityList,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> cityList = snapshot.data!;
            return DropdownButtonFormField2<Map<String, dynamic>>(
              isExpanded: true,
              dropdownSearchData: DropdownSearchData(
                searchController: textSearch,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textSearch,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Pesquise a cidade',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),

              // Limpa o valor do controlador da pesquisa
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textSearch.clear();
                }
              },

              // Decoração dos itens do dropdown
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 300,
              ),

              decoration: InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              hint: const Text("Selecione sua cidade"),
              value: _selectedCity,
              onChanged: (Map<String, dynamic>? value) {
                setState(() {
                  _selectedCity = value;
                  widget.onCitySelected?.call(_selectedCity);
                });
              },
              items: cityList.map((Map<String, dynamic> city) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: city,
                  child: Text('${city['cidade']} - ${city['UF']}'),
                );
              }).toList(),

              validator: (Map<String, dynamic>? value) {
                if (value == null) {
                  return "Insira a cidade";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
