import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/BuildTextFieldCustom.dart';

class TelaHomeTeste extends StatefulWidget {
  const TelaHomeTeste({super.key});

  @override
  State<TelaHomeTeste> createState() => _TelaHomeTesteState();
}

class _TelaHomeTesteState extends State<TelaHomeTeste> {
  TextEditingController controlerPesquisaCarro = TextEditingController();

  String campoFinal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        //centerTitle: true,
        //title: Text("home"),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.account_circle_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTextFieldCustom(
                  controlador: controlerPesquisaCarro,
                  dica: "procure por modelo, marca...",
                  tipo: "pesquisa"),
              _buildTitulo("Veículos em destaque"),
              _buildRowVerMais(),
              SizedBox(
                height: 8,
              ),
              _buildImagem(),
              _buildTitulo("Últimos alugueis"),
              _buildCardUltimosAlugueis(
                  "João das Neves", "Ford fiesta 2023", "3 dias"),
              _buildCardUltimosAlugueis(
                  "Rafael Campos", "Corola 2024", "2 dias"),
              _buildCardUltimosAlugueis(
                  "João das Neves", "Ford fiesta 2023", "3 dias"),
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCardUltimosAlugueis(
      String cliente, String carro, String diasRestantes) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                ),
                Text(cliente),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [Text(carro), Icon(Icons.search)],
                ),
                Text("Devolucao em: ${diasRestantes}"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Center _buildImagem() {
    return Center(
      child: Container(
        width: 400,
        child: Image.asset(
          "assets/images/fiat-mobi.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row _buildRowVerMais() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.remove_red_eye,
          size: 14,
        ),
        Text("ver mais"),
      ],
    );
  }

  Widget _buildTitulo(String titulo) {
    return Text(
      titulo,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  void _cliqueDoBotao() {
    setState(() {
      campoFinal = controlerPesquisaCarro.text;
    });
  }
}
