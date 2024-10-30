import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentcarapp_prof/widgets/BuildTextFieldCustom.dart';
import 'package:rentcarapp_prof/widgets/CustomDropDownMenu.dart';

class TelaAlugarTeste extends StatefulWidget {
  const TelaAlugarTeste({super.key});

  @override
  State<TelaAlugarTeste> createState() => _TelaAlugarTesteState();
}

class _TelaAlugarTesteState extends State<TelaAlugarTeste> {
  String? opcaoSelecionadaCliente;
  String? opcaoSelecionadaCarro;
  final List<String> opcoesMenuCliente = [
    'Selecione o cliente',
    'Opção 1',
    'Opção 2',
    'Opção 3',
    'Opção 4'
  ];
  final List<String> opcoesMenuCarro = [
    'Selecione o carro',
    'Onix 2024',
    'Fiat mobi 2022',
    'Ford fiesta 2023',
  ];
  String dicaDataAluguel = "Data";

  TextEditingController controladorData = TextEditingController();
  TextEditingController controladorDias = TextEditingController();

  String dicaQtdDiasAluguel = "Quantidade de dias ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Novo Aluguel"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomDropDownMenu(
                    opcaoSelecionada: opcaoSelecionadaCliente,
                    hintText: "Selecione o cliente",
                    options: opcoesMenuCliente,
                    onChanged: (value) {
                      setState(() {
                        opcaoSelecionadaCliente = value;
                      });
                    },
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 12.0, bottom: 8),
                      child: BuildTextFieldCustom(
                        controlador: controladorData,
                        dica: dicaDataAluguel,
                        tipo: "normal",
                        iconeFinal: Icons.calendar_month_outlined,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: BuildTextFieldCustom(
                      controlador: controladorDias,
                      dica: dicaQtdDiasAluguel,
                      tipo: "semIcone",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomDropDownMenu(
                    opcaoSelecionada: opcaoSelecionadaCarro,
                    hintText: "Selecione o carro",
                    options: opcoesMenuCarro,
                    onChanged: (value) {
                      setState(() {
                        opcaoSelecionadaCarro = value;
                      });
                    },
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}
