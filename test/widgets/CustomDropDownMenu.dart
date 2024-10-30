// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String? opcaoSelecionada;

  final Function(String?) onChanged;

  final List<String> options;

  final String hintText;

  const CustomDropDownMenu({
    Key? key,
    this.opcaoSelecionada,
    required this.onChanged,
    required this.options,
    required this.hintText,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 4, 12, 4),
        child: DropdownButton<String>(
            underline: SizedBox(),
            value: widget.opcaoSelecionada,
            hint: Align(
                alignment: Alignment.centerLeft, child: Text(widget.hintText)),
            isExpanded: true,
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.grey,
            ),
            items:
                widget.options.map<DropdownMenuItem<String>>((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Container(child: Text(option)),
              );
            }).toList(),
            onChanged: widget.onChanged),
      ),
    );
  }
}
