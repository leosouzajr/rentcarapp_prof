import 'package:flutter/material.dart';

class TelaEdicaoUsuario extends StatefulWidget {
  const TelaEdicaoUsuario({super.key});

  @override
  State<TelaEdicaoUsuario> createState() => _TelaEdicaoUsuarioState();
}

class _TelaEdicaoUsuarioState extends State<TelaEdicaoUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Center());
  }
}
