import 'package:flutter/material.dart';

class TelaListaClientes extends StatefulWidget {
  const TelaListaClientes({super.key});

  @override
  State<TelaListaClientes> createState() => _TelaListaClientesState();
}

class _TelaListaClientesState extends State<TelaListaClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Clientes"),
        ),
        body: Center(
          child: Text("aba Lista clientes"),
        ));
  }
}
