import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  final String titulo;

  const ItemLista({required this.titulo, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(titulo),
      ),
    );
  }
}
