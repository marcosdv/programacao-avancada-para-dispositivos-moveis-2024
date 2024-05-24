import 'package:flutter/material.dart';

class BotaoTexto extends StatelessWidget {
  final String texto;
  final VoidCallback clique;
  final Color? cor;

  const BotaoTexto({required this.texto,
    required this.clique, this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clique,
      child: Text(texto, style: TextStyle(color: cor))
    );
  }
}
