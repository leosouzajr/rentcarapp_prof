import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentcarapp_prof/testes/widgets/BuildTextFieldCustom.dart';
import 'package:rentcarapp_prof/views/TelaEdicaoUsuario.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  TextEditingController controlerPesquisaCarro = TextEditingController();
  TextEditingController controlerTeste = TextEditingController();
  String campoFinal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        //  leading: Icon(Icons.home),
        //centerTitle: true,
        //title: Text("home"),
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            iconSize: 40,
            icon: Icon(Icons.account_circle_rounded),
            onPressed: () {
              _abrirTelaEditarUsuario(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextFieldCustom(
                controlador: controlerPesquisaCarro,
                dica: "procure por marca, modelo...",
                isPesquisa: true,
                semIcone: true),
            //   _buildTextField(controlerPesquisaCarro, "digite seu nome"),
            _buildTitulo("Veículos em destaque"),
            _buildRowVerMais(),
            SizedBox(
              height: 8,
            ),
            _buildImagem(),
            _buildTitulo("Últimos alugueis"),
            _buildCardUltimosAlugueis(
                "João das Neves", "Ford fiesta 2023", "3 dias"),
            _buildCardUltimosAlugueis("Rafael Campos", "Corola 2024", "2 dias"),
            _buildCardUltimosAlugueis(
                "João das Neves", "Ford fiesta 2023", "3 dias"),
          ],
        ),
      ),
    );
  }

  Widget _buildCardUltimosAlugueis(
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
        width: 370,
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

  Widget _buildTextField(TextEditingController controler, String dica) {
    return Container(
      height: 90,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
            controller: controler,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                alignLabelWithHint: true,
                hintText: dica,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25))))),
      ),
    );
  }

  void _cliqueDoBotao() {
    setState(() {
      campoFinal = controlerPesquisaCarro.text;
    });
  }

  void _abrirTelaEditarUsuario(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaEdicaoUsuario(),
        ));
  }
}
