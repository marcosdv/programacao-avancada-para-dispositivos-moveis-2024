import 'package:aula06_api/models/pokemon.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetalhesPage(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(pokemon.nome, style: TextStyle(color: Colors.amber.shade500)),
          backgroundColor: Colors.blue.shade900,
        ),
        body: ListView(
          children: [
            Image.network(pokemon.imagem(), fit: BoxFit.cover,),
          ],
        ),
      ),
    );
  }
}
