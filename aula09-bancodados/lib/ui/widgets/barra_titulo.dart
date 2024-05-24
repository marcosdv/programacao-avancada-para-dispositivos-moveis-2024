import 'package:flutter/material.dart';

class BarraTitulo {
  PreferredSizeWidget show(String texto) {
    return AppBar(
      title: Text(texto),
      centerTitle: true,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    );
  }
}