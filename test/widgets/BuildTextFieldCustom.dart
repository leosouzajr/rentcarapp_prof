import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildTextFieldCustom extends StatefulWidget {
  final TextEditingController controlador;
  final String dica;
  final String tipo;
  final IconData iconeFinal;

  const BuildTextFieldCustom(
      {super.key,
      required this.controlador,
      required this.dica,
      required this.tipo,
      this.iconeFinal = Icons.abc});

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
              prefixIcon: widget.tipo == "pesquisa" ? Icon(Icons.search) : null,
              suffixIcon: widget.tipo == "normal"
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
              alignLabelWithHint: true,
              hintText: widget.dica,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
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
