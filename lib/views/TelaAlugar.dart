import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/BuildTextFieldCustom.dart';
import '../widgets/CustomDropDownMenu.dart';

class TelaAlugar extends StatefulWidget {
  const TelaAlugar({super.key});

  @override
  State<TelaAlugar> createState() => _TelaAlugarState();
}

class _TelaAlugarState extends State<TelaAlugar> {
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
                    tipo: "cliente",
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
                        semIcone: false,
                        isPesquisa: false,
                        controlador: controladorData,
                        dica: dicaDataAluguel,
                        iconeFinal: Icons.calendar_month_outlined,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: BuildTextFieldCustom(
                      semIcone: true,
                      isPesquisa: false,
                      controlador: controladorDias,
                      dica: dicaQtdDiasAluguel,
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
                    tipo: "carro",
                    onChanged: (value) {
                      setState(() {
                        opcaoSelecionadaCarro = value;
                      });
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              FilledButton(onPressed: () {}, child: Text("Obter Orcamento")),
            ],
          ),
        ));
  }
}
