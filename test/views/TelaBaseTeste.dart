import 'package:flutter/material.dart';
import 'package:rentcarapp_prof/views/TelaAlugarTeste.dart';
import 'package:rentcarapp_prof/views/TelaHomeTeste.dart';
import 'package:rentcarapp_prof/views/TelaLIstaClientesTeste.dart';
import 'package:rentcarapp_prof/widgets/BottonBarCustom.dart';

class TelaBaseTeste extends StatefulWidget {
  const TelaBaseTeste({super.key});

  @override
  State<TelaBaseTeste> createState() => _TelaBaseTesteState();
}

class _TelaBaseTesteState extends State<TelaBaseTeste> {
  int indexAtual = 0;
  final List<Widget> abas = [
    TelaHomeTeste(),
    TelaAlugarTeste(),
    TelaListaClientes()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: abas[indexAtual],
      bottomNavigationBar:
          BottomBarCustom(indexAtual: indexAtual, onTap: _onTapBarra),
    );
  }

  void _onTapBarra(int value) {
    setState(() {
      indexAtual = value;
    });
  }
}
