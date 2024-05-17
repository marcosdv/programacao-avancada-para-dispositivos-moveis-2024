import 'package:flutter/material.dart';

class MensagemErro extends StatelessWidget {
  final String texto;

  const MensagemErro({required this.texto, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.error, color: Colors.red,),
        Text(texto, style: const TextStyle(color: Colors.red, fontSize: 18)),
      ],
    );
  }
}
