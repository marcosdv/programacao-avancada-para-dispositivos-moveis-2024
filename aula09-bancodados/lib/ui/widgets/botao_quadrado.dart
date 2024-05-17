import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final String texto;
  final VoidCallback clique;
  final IconData? icone;
  final Color? cor;

  const BotaoQuadrado({required this.clique, this.texto = '',
    this.icone, this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clique,
      style: ElevatedButton.styleFrom(backgroundColor: cor),
      child: icone != null ? Icon(icone) : Text(texto)
    );
  }
}
