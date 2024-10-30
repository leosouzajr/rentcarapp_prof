// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildTextFieldCustom extends StatefulWidget {
  final TextEditingController controlador;
  final String dica;

  final bool isPesquisa;
  final bool semIcone;
  final IconData iconeFinal;

  const BuildTextFieldCustom({
    Key? key,
    required this.controlador,
    required this.dica,
    required this.isPesquisa,
    required this.semIcone,
    this.iconeFinal = Icons.abc,
  }) : super(key: key);

  @override
  State<BuildTextFieldCustom> createState() => _BuildTextFieldCustomState();
}

class _BuildTextFieldCustomState extends State<BuildTextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // width: 800,
      child: TextField(
          controller: widget.controlador,
          decoration: InputDecoration(
              prefixIcon: widget.isPesquisa ? Icon(Icons.search) : null,
              suffixIcon: !widget.semIcone
                  ? widget.iconeFinal == Icons.calendar_month_outlined
                      ? GestureDetector(
                          child: Icon(
                            widget.iconeFinal,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            _selecionarData(context);
                          },
                        )
                      : Icon(
                          widget.iconeFinal,
                          color: Colors.grey,
                        )
                  : null,
              fillColor: Colors.white,
              filled: true,
              label: Text(widget.dica),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }

  Future<void> _selecionarData(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      widget.controlador.text =
          formattedDate; // Atualiza o controlador com a data escolhida
    }
  }
}
