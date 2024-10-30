// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BottomBarCustom extends StatefulWidget {
  final int indexAtual;
  final ValueChanged<int> onTap;

  const BottomBarCustom({
    Key? key,
    required this.indexAtual,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.indexAtual,
        onTap: widget.onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: "Alugar"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Clientes"),
        ]);
  }
}
