// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String? opcaoSelecionada;

  final Function(String?) onChanged;

  final String tipo;
  final String hintText;

  const CustomDropDownMenu({
    Key? key,
    this.opcaoSelecionada,
    required this.onChanged,
    required this.tipo,
    required this.hintText,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  List<String> options = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.tipo == "cliente") {
      options = [
        "Selecionar o cliente",
        "Rafael Campos Silva",
        "Jasmine Willer",
        "Tayna Pires",
        "Regis Moura"
      ];
    }
    if (widget.tipo == "carro") {
      options = [
        "Selecionar o carro"
            "Onix 2024",
        "Fiat Mobi 2022",
        "Ford Fiesta 2023",
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 1), // Cor e largura da borda
              borderRadius: BorderRadius.circular(8), // Bordas arredondadas
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1), // Borda ao focar
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          value: widget.opcaoSelecionada,
          hint: Align(
              alignment: Alignment.centerLeft, child: Text(widget.hintText)),
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.grey,
          ),
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Container(child: Text(option)),
            );
          }).toList(),
          onChanged: widget.onChanged),
    );
  }
}
