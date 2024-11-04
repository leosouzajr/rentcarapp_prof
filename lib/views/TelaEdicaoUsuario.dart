import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentcarapp_prof/testes/views/TelaHome.dart';
import 'package:rentcarapp_prof/testes/widgets/BuildTextFieldCustom.dart';

class TelaEdicaoUsuario extends StatefulWidget {
  const TelaEdicaoUsuario({super.key});

  @override
  State<TelaEdicaoUsuario> createState() => _TelaEdicaoUsuarioState();
}

class _TelaEdicaoUsuarioState extends State<TelaEdicaoUsuario> {
  TextEditingController controladorNome = TextEditingController();
  TextEditingController controladorEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus dados"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _cliqueVoltar();
            },
          ),
        ),
        body: Column(
          children: [
            BuildTextFieldCustom(
                controlador: controladorNome,
                dica: "Nome",
                isPesquisa: false,
                semIcone: true),
            BuildTextFieldCustom(
                controlador: controladorEmail,
                dica: "Email",
                isPesquisa: false,
                semIcone: true),
            Row(
              children: [
                Expanded(
                  child: BuildTextFieldCustom(
                      controlador: controladorEmail,
                      dica: "Email",
                      isPesquisa: false,
                      semIcone: true),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BuildTextFieldCustom(
                      controlador: controladorEmail,
                      dica: "Email",
                      isPesquisa: false,
                      semIcone: true),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: BuildTextFieldCustom(
                      controlador: controladorEmail,
                      dica: "Email",
                      isPesquisa: false,
                      semIcone: true),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: BuildTextFieldCustom(
                      controlador: controladorEmail,
                      dica: "Email",
                      isPesquisa: false,
                      semIcone: true),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: () {}, child: Text("cancelar")),
                FilledButton(onPressed: () {}, child: Text("Salvar"))
              ],
            ),
          ],
        ));
  }

  void _cliqueVoltar() {
    Navigator.pop(context);
  }
}
