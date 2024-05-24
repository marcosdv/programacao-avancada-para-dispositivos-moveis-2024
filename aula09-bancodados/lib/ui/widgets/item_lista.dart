import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  final String titulo;
  final VoidCallback? clique;
  final VoidCallback? cliqueLongo;

  const ItemLista({required this.titulo,
                   this.clique, this.cliqueLongo, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clique,
      onLongPress: cliqueLongo,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(titulo),
        ),
      ),
    );
  }
}
