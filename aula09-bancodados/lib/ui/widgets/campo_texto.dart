import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String texto;
  final TextInputType teclado;

  const CampoTexto({required this.controller, this.texto = '',
    this.teclado = TextInputType.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: texto,
          border: const OutlineInputBorder()
        ),
      ),
    );
  }
}
